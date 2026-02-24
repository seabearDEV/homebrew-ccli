class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.3.0/ccli-macos-universal"
    sha256 "288d90eb9a60d1f55dcfb12d1663c1608c239120bc29df4d1ce69492f505de79"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.3.0/ccli-linux-arm64"
      sha256 "883d4466c47799299b539d46747d871229c82e6c36037d21fc301dea9b5185d3"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.3.0/ccli-linux-x64"
      sha256 "727da017fa93f0e9e49106c9ba9b82d2be82ac6f201efd9f97b3e83676e3ce19"
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
