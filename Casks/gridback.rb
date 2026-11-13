# typed: strict
# frozen_string_literal: true

cask "gridback" do
  version "0.3.3"
  sha256 "bbbe978c186a62ba0a5761ee6fe8545aa8b1a5dc6b628ddcd44b92adfb13bebe"

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
