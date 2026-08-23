cask "dnser-desktop" do
  version "1.0.7-rc4"
  sha256 arm:   "58c6157fc3d3b01d024a720c1d0d55f555a3af8d4f9731fbdeb834102c2e933f",
         intel: "605b49af6a08859d380b37ee4ba8d4265381166c174633b78485b5b401712703"

  on_arm do
    url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/DNSer_#{version}_macOS_arm64.dmg"
  end
  on_intel do
    url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/DNSer_#{version}_macOS_amd64.dmg"
  end

  name "DNSer"
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"

  auto_updates false
  depends_on macos: :big_sur

  app "DNSer.app"
end
