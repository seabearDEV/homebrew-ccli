class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.4/ccli-macos-universal"
    sha256 "58b843ba968fca37671a3add9b4c8268c2fe21ef54dd6e0aec27e8f15c23cc63"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.4/ccli-linux-arm64"
      sha256 "07cffe79bcf074086326cd1f35eebbb0170b9c2a0190b73ecc770159798a7232"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.4/ccli-linux-x64"
      sha256 "0c632fce4f6b807ff84fb7e59d4291e464e4381d12e1609d9acf09c845c2afdc"
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
