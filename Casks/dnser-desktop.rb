cask "dnser-desktop" do
  version "1.1.0-rc2"
  sha256 arm:   "070145fe14f5c9b769dd0bcbeab8f0506846a33322ced79e98ddfab92575165d",
         intel: "353bc9f52b3b22e7bb05b3e2ed005fab9abe1ca5bee5d130c3313c7baadb8ed9"

  on_arm do
    url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc2/DNSer_#{version}_macOS_arm64.dmg"
  end
  on_intel do
    url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc2/DNSer_#{version}_macOS_amd64.dmg"
  end

  name "DNSer"
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"

  auto_updates false
  depends_on macos: :big_sur

  app "DNSer.app"
end
