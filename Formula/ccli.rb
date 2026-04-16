class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.12.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.1/ccli-macos-universal"
    sha256 "41ac71d5b29a87d1374cb0a54e31e815cec1ab4ad1bbc297bdb4f1007cf9d1a9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.1/ccli-linux-arm64"
      sha256 "f503a25294a535ada16f0085bc6b2443fe271339ace4730eecc65363f8aa5d9f"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.1/ccli-linux-x64"
      sha256 "7b16f66bcbbd074c08bfdc3dd7fdb81a760139cdce8857f9463286a4e12fb120"
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
