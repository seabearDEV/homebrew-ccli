class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.0/ccli-macos-arm64"
    sha256 "9e99f1b4f44f2b29c002f97a30c16f1ab1f84c04566a562a3dc1485ff4a8b842"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.0/ccli-linux-arm64"
      sha256 "ad53fbd23c80918e0bd300d23f6981b95a37129238007dca6e506f07b6ac4a4e"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.0/ccli-linux-x64"
      sha256 "5436272d874e027b6be87b1c473a240ce15bf5ee7239d47e3ceb2e2717a08161"
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
