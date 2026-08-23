class Dnser < Formula
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"
  version "1.0.1"
  license "BUSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_arm64.tar.gz"
      sha256 "aac317c3958ec5efb23019950761dce02490039a8ad246cd82347d59d5d1d056"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_amd64.tar.gz"
      sha256 "6446d756cb80cff0005f48265ac0922275a836468b967a98acb719fcfdacdd40"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_arm64.tar.gz"
      sha256 "b72d4bf6198b27b025aa1c5483a64522d20ef66f1e941cbb0636083f40427572"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_amd64.tar.gz"
      sha256 "9f41e2f8c19b64d009c5fee9958b1dc67d50ba51012179edbe31fe3e5b212ddd"
    end
  end

  def install
    bin.install "dnser"
  end

  def caveats
    <<~EOS
      Run the one-time guided setup:
        dnser setup

      Setup starts dnser as a privileged daemon so port 53 works, verifies it,
      and only then points your system DNS at it.
      Dashboard: dnser open
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dnser version")
  end
end
