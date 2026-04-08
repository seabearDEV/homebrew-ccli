class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.0/ccli-macos-universal"
    sha256 "9626b5b3b27d7da7b29e879c7c6faa013a55c632b24c0d43d33cde6306859a2c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.0/ccli-linux-arm64"
      sha256 "4f62042b4f9033ae69ed51b99ba5853900a14647f1d097e25115ffe5143aed53"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.0/ccli-linux-x64"
      sha256 "20fabe7cbdff534e4e721fd513d7f6aff3a4538b1a176692aefdd8539690ca23"
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
