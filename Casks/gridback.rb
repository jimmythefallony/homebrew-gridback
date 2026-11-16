# typed: strict
# frozen_string_literal: true

cask "gridback" do
  version "0.3.5"
  sha256 "e704946dc19d5a35085deb75c3b0492b4fe62ef86ba3e2ffedf2be2b589fa8ec"

  url "https://github.com/jimmythefallony/gridback/releases/download/v#{version}/GridBack-v#{version}.zip"
  name "GridBack"
  desc "Menu-bar replacement for the classic Launchpad"
  homepage "https://github.com/jimmythefallony/gridback"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "GridBack.app"

  zap trash: [
    "~/Library/Application Support/GridBack",
    "~/Library/Preferences/com.jimmythefallony.GridBack.plist",
  ]
end
