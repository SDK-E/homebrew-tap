class Dnser < Formula
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"
  version "1.1.0-rc1"
  license "BUSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/dnser_1.1.0-rc1_Darwin_arm64.tar.gz"
      sha256 "30f8c44218621e0501e422905abfe2c80ff8026ed839fcffa35c4e56d98b7bcb"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/dnser_1.1.0-rc1_Darwin_amd64.tar.gz"
      sha256 "fcb0decb355f557048f52411c8b4a632a7e4a618fe55b10fb7e2707e3045bbbf"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/dnser_1.1.0-rc1_Linux_amd64.tar.gz"
      sha256 "1e466dff4cb27b3ea9fbf2ac1f579ee22ed2ace97b0245f897929064aee1c671"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/dnser_1.1.0-rc1_Linux_arm64.tar.gz"
      sha256 "094f325c7cd65eea131ede16b6793980e3d4a3f58f0d6b651feee0dd9982a115"
    end
  end

  def install
    bin.install "dnser"
  end

  def caveats
    <<~EOS
      Run the guided setup once:
        dnser setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dnser version")
  end
end
