class Dnser < Formula
  desc "Local DNS management for development"
  homepage "https://github.com/SDK-E/dnser"
  version "1.0.0"
  license "BUSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_arm64.tar.gz"
      sha256 "8992e3169feaecf4ce676687fdd79d38c09f7f39613f5eca768cf6eef612f8b6"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Darwin_amd64.tar.gz"
      sha256 "687ebe99a2158787d10977d071755f7c8a330b07083589710e790d3b1b358f4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_arm64.tar.gz"
      sha256 "6faa992858c4cf9d02e50964d0aaa1bbd5b9f50bce482d77f221c37e18b2aade"
    else
      url "https://github.com/SDK-E/dnser/releases/download/v#{version}/dnser_#{version}_Linux_amd64.tar.gz"
      sha256 "88ba409530a39aadb872ebb8b852329d2cf9594bb3ab5d55aa954286236cc175"
    end
  end

  def install
    bin.install "dnser"
  end

  def caveats
    <<~EOS
      Run the one-time guided setup:
        dnser setup

      Dashboard: dnser open
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dnser version")
  end
end
