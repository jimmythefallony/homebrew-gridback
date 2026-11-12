# typed: strict
# frozen_string_literal: true

cask "gridback" do
  version "0.3.2"
  sha256 "59c7a2f4f08bc32806e9febc6080914048bdcee6e37c8c90f60e33ed1b6ea688"

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
