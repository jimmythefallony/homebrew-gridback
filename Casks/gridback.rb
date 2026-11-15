# typed: strict
# frozen_string_literal: true

cask "gridback" do
  version "0.3.4"
  sha256 "c8b953e6df76034871d7348aea0d19a38597577baa70dfd74498d5d967e651d9"

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
