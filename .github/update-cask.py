#!/usr/bin/env python3
"""Point the cask at the latest GridBack release zip.

This only edits Casks/gridback.rb. It does not publish or replace a release.
"""

import hashlib
import json
import re
import urllib.request
from pathlib import Path

API = "https://api.github.com/repos/jimmythefallony/gridback/releases/latest"
CASK = Path("Casks/gridback.rb")


def fetch(url: str) -> bytes:
    request = urllib.request.Request(
        url,
        headers={
            "Accept": "application/vnd.github+json",
            "User-Agent": "homebrew-gridback",
        },
    )
    with urllib.request.urlopen(request, timeout=120) as response:
        return response.read()


def main() -> None:
    release = json.loads(fetch(API))
    tag = release["tag_name"]
    if not re.fullmatch(r"v\d+\.\d+\.\d+", tag):
        raise SystemExit(f"The latest tag {tag!r} is not a plain version.")
    version = tag[1:]
    asset_name = f"GridBack-v{version}.zip"
    asset = next((item for item in release["assets"] if item["name"] == asset_name), None)
    if asset is None:
        raise SystemExit(f"The latest release has no {asset_name}.")

    digest = hashlib.sha256(fetch(asset["browser_download_url"])).hexdigest()
    text = CASK.read_text()
    updated = re.sub(r'version "[^"]+"', f'version "{version}"', text, count=1)
    updated = re.sub(r'sha256 "[0-9a-f]+"', f'sha256 "{digest}"', updated, count=1)
    if updated == text:
        print(f"Already at {version}.")
        return
    CASK.write_text(updated)
    print(f"Updated to {version} {digest}")


if __name__ == "__main__":
    main()
