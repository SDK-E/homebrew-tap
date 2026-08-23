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
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_arm64.tar.gz"
      sha256 "b52ae81ce14499e7d948c17ba683bf558bbd9403d1ccae73decfa1ce14d80c26"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_amd64.tar.gz"
      sha256 "cb355c8edec54605a18a9ce04193c801ab3d2258200e311d7f4e8c42d44bb106"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_arm64.tar.gz"
      sha256 "609029f6d7dde15171401b38ea753c3fe83cbe449091c2ecedbeed7237d34b41"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_amd64.tar.gz"
      sha256 "fbebf5a5df2ced500933b6b39d002b996eead636ce326c8e42bbf5d63775fd14"
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
