class Dnser < Formula
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"
  version "1.0.6"
  license "BUSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.6/dnser_1.0.6_Darwin_arm64.tar.gz"
      sha256 "d082f70f7f92305d5da62943428a28db89eec43d1f252e5d50f57870f88e3d59"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.6/dnser_1.0.6_Darwin_amd64.tar.gz"
      sha256 "21bb763eb9687d3ea26371ab47d2cac1c8b30b2cdde246e4dc69398a00bd812e"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.6/dnser_1.0.6_Linux_amd64.tar.gz"
      sha256 "021c104435cdef495c48e699cf46c7f233123ef0b83e128654cfc1858ffa550f"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.6/dnser_1.0.6_Linux_arm64.tar.gz"
      sha256 "7b2c7cbf89a5e39f4d46502610b1c3e84d22ce79aeb5e65500f375ee4ae68d8f"
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
