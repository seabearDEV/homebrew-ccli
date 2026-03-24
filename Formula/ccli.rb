class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.4.0/ccli-macos-universal"
    sha256 "13b1688dc18b2c864f8f83beec55d78d9e6f3196a7a6eb86330c6f4f332d6fe2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.4.0/ccli-linux-arm64"
      sha256 "bd8ed86b0dd74950d03578061c6729fc2eb87c590d84bfc346715433324fecdc"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.4.0/ccli-linux-x64"
      sha256 "d004c6e4db1e2dc920da1b3b45fffa62620a31a36f977edc4c32c733d4c0ef06"
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
