class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.13.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.13.0/ccli-macos-universal"
    sha256 "67a0b144c792fbea6427de009a83c656f0fe482d625710f097e4813615d6c3fd"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.13.0/ccli-linux-arm64"
      sha256 "9853e38887133f2bce9e3ff2af73394c4d349f75909d3b197805301c3aafcbad"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.13.0/ccli-linux-x64"
      sha256 "d696af4f9b11e23d64c1ed4853e49c96c86b25d2c8d2dfb63b1bd7a91818c25f"
    end
  end

  def install
    binary = Dir.glob("ccli-*").first
    bin.install binary => "ccli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccli --version")
  end
end
