class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.12.0-beta.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.0-beta.0/ccli-macos-universal"
    sha256 "b2987813ba399f3fa033adbdfff99c772564a6f3a6e74219631ff9b864600065"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.0-beta.0/ccli-linux-arm64"
      sha256 "33f774d78073837e3ff7bb06d2ea7d10a1725a53da98fecb00fa73a349f168f1"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.0-beta.0/ccli-linux-x64"
      sha256 "eaa9678132fc9adeaf8b1225672d906587aac1fb0519305a59ec94beefc6f47e"
    end
  end

  def install
    binary = Dir.glob("ccli-*").first
    bin.install binary => "ccli-beta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccli-beta --version")
  end
end
