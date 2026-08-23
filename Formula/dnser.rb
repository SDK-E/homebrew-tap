class Dnser < Formula
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"
  version "1.0.7-rc4"
  license "BUSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/dnser_1.0.7-rc4_Darwin_arm64.tar.gz"
      sha256 "1871405f5716b17ff06143ec349f4adc85442c62b35fd6eeb5ddd537fa78a3c2"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/dnser_1.0.7-rc4_Darwin_amd64.tar.gz"
      sha256 "964044a4893807239fc93caf8b3888c6849f82fe25b8e4eee6cf9e4efb00df3a"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/dnser_1.0.7-rc4_Linux_amd64.tar.gz"
      sha256 "71afd42d42ac3b7433cc49ac9fa106af9f6b283f4c0d684e8ada9a6264429798"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/dnser_1.0.7-rc4_Linux_arm64.tar.gz"
      sha256 "0eb89a96b808577b04dfbe817140172fb472a5670954dd3c696a337c8914d564"
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
