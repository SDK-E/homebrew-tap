class Dnser < Formula
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"
  version "1.0.3"
  license "BUSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_arm64.tar.gz"
      sha256 "9cc9ea49d8caf940aa8f39bbbd3dc6096d86437dd9446123d308483fe232bce0"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_amd64.tar.gz"
      sha256 "0fb967081a0ca50f1b85e8627a585f4c8f84aff8d05cd27bffe649226b6939b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_arm64.tar.gz"
      sha256 "a30d24365686300103ac40dc4e9c1af6ac9702470513f2aff8698abbd4b965fc"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_amd64.tar.gz"
      sha256 "e4b2f1471c390f1422e1ac1e80c1c9e5eab263f57aa443b02ededc53acf604d8"
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
