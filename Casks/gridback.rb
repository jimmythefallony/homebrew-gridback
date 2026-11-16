# typed: strict
# frozen_string_literal: true

cask "gridback" do
  version "0.3.6"
  sha256 "02a136165ba0d1f2a4dc10d0d00a94e9095f802d26dfde8ffde6f93c9058852a"

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
