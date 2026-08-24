class Dnser < Formula
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"
  version "1.1.0-rc2"
  license "BUSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc2/dnser_1.1.0-rc2_Darwin_arm64.tar.gz"
      sha256 "b9f588fa7600fae9b21a0a4288e3adc925c27fcb535b2a246269f818ace31d68"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc2/dnser_1.1.0-rc2_Darwin_amd64.tar.gz"
      sha256 "6d74f35a1ebaa0b35c8a402a0a57f2272672df3f93b1bde3c09e499ebd02a9cf"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc2/dnser_1.1.0-rc2_Linux_amd64.tar.gz"
      sha256 "dbc683a4bb8b0c0fd0fae9e4179c5284c39b7cd55964d4cc4b9b699d171a33b8"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v1.1.0-rc2/dnser_1.1.0-rc2_Linux_arm64.tar.gz"
      sha256 "bb602c272fcb33455d07d47fbb823e4e807888922c17aa3f068d9226f9f1b24c"
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
