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
      sha256 "0a609bfa80c3c61572b43f762699ca186e34ecd1475d0b6961a8eb6ee64a51c8"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/dnser_1.1.0-rc1_Darwin_amd64.tar.gz"
      sha256 "777c7fbacf696adce2576cc2947e372c3ddc5b835884be5670603ca7201385b6"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/dnser_1.1.0-rc1_Linux_amd64.tar.gz"
      sha256 "4565220a810aa1a2b1bbc79c3cc5c9fee794673d57756d20aeb020aa24393f50"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc1/dnser_1.1.0-rc1_Linux_arm64.tar.gz"
      sha256 "372944f06105df771dded67c533ece562ce9b96af2f0f721593fb29f440032e3"
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
