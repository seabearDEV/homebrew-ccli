class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.4.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.2/ccli-macos-universal"
    sha256 "35cfe84b47d7bbe070d0131ee99e0c7efd444171922113694e9c9255118572d5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.2/ccli-linux-arm64"
      sha256 "b8960f8d6594f4a484907d11adf6d437e8903037f3c30662ccc45c5916968e23"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.2/ccli-linux-x64"
      sha256 "687a45d19009368f7d07f56d6dda3c7243835926ec07d53fe84a6f476e244be8"
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
