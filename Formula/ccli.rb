class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.0/ccli-macos-universal"
    sha256 "a8682d450dcbdab6f3a8c9ba5c91673a2babe6686e449228ef837aa50f83bc50"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.0/ccli-linux-arm64"
      sha256 "66039dbc5982374d63e78f78e5ff2600d898fed0bf11baa82b84b5275313e64a"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.0/ccli-linux-x64"
      sha256 "4bb6eeed9eb1665abc3a388db0033e10f8a06f2c930024247d64e524219a3340"
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
