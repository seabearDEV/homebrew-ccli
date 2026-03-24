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
    sha256 "63bcb6a252e3cf56da396279bd6035e7d82d894a9ead2a11867f7527aa8c740b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.4.0/ccli-linux-arm64"
      sha256 "5c991acd693b4a5fe6c6c3cce57290b3f915257944133ce6f559a13b0b572a22"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.4.0/ccli-linux-x64"
      sha256 "3e5766d07106f3e7a2bd694822a3e2c6ba431a981f147eb4588d63ca1576fa76"
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
