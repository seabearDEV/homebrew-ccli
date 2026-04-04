class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.8.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.8.1/ccli-macos-universal"
    sha256 "14706a763a3a91cfc0eed5666185714a555ccf55537c1b82f18a5c63a9bb4c40"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.8.1/ccli-linux-arm64"
      sha256 "8237de4b26746092f6d6ad46107995db432f90fceb85dd1acf6ab0f75bd0b4c6"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.8.1/ccli-linux-x64"
      sha256 "01daa24e61d4af6d37678657cb6a2f5d027bde37dc5105721200757e6034c592"
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
