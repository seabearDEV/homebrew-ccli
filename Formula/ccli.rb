class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.0.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.0.0/ccli-macos-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.0.0/ccli-macos-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.0.0/ccli-linux-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.0.0/ccli-linux-x64"
      sha256 "PLACEHOLDER"
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
