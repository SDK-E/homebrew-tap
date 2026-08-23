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
      sha256 "1fbda55ce280aff4c4088db857ad74fe8ed83172d2bf48e25eefc009f82ba2af"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/dnser_1.0.7-rc4_Darwin_amd64.tar.gz"
      sha256 "bbab63aa9d6cbcbb3d7ae3badd31cc4daa4004422190f66ee74d6c8649cce86d"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/dnser_1.0.7-rc4_Linux_amd64.tar.gz"
      sha256 "a6222936fb1779b59e3deda8f8ac26b51cb84e207132caf4c061f5597fc837d2"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.0.7-rc4/dnser_1.0.7-rc4_Linux_arm64.tar.gz"
      sha256 "4d20b45f0143985c0cd49b837b5d90d660914c3281b757e07b806933b55e1a95"
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
