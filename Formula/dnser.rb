class Dnser < Formula
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"
  version "1.0.2"
  license "BUSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_arm64.tar.gz"
      sha256 "335ebad92c2ffee7007fa0d4c39ebe8a9e0be9b0589e3f1a4007755a6718d1d3"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_amd64.tar.gz"
      sha256 "ec5d8fee45d1eb4bbb11dbf0b41de488c4e8329a4e6e358d5de7a0e1a5a67426"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_arm64.tar.gz"
      sha256 "87020f8a84e93b068582875d346f4ceb1eb47ffcd94c0ef0a8e1017460e10833"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_amd64.tar.gz"
      sha256 "4a6a0ba1d13bc6e429c699fbf2c6708547975c0e06c30305643927e9a9be5c78"
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
