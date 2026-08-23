cask "dnser-desktop" do
  version "1.1.0-rc1"
  sha256 arm:   "5217482f81a30c32b92b88534f194e4af8f66b69f768ebe495f40eb4d58eb1e6",
         intel: "5d60b58009932561f5e31a10f6cee10271218156f4ab53d02559aa8912606eb1"

  on_arm do
    url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/DNSer_#{version}_macOS_arm64.dmg"
  end
  on_intel do
    url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/DNSer_#{version}_macOS_amd64.dmg"
  end

  name "DNSer"
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"

  auto_updates false
  depends_on macos: :big_sur

  app "DNSer.app"
end
