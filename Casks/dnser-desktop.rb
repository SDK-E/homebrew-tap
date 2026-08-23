cask "dnser-desktop" do
  version "1.1.0-rc1"
  sha256 arm:   "6ec1bcbff72d15f217ca6ee19f9e48e7c205312c1b99e26eaed7f51ac31621c5",
         intel: "7f813da0aaa3b94f4be76199d0756ab1cf6ee90995b13217f8723251dd3d2e9f"

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
