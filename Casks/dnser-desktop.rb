cask "dnser-desktop" do
  version "1.0.7-rc4"
  sha256 arm:   "fcf4fea010bcdbace80b26d49cfe95b5c5815878482d3b35a3219631df88d952",
         intel: "a5e3cb1f809829d1d9b18087702dfb0fa5a9f6c0f85e2ad78b5b793ba094af64"

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
