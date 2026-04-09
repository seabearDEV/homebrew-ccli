class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.7/ccli-macos-universal"
    sha256 "44dd2e982579736e945574ff0c6d7d4de47bf7475aef399aa870e45c8a14d75f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.7/ccli-linux-arm64"
      sha256 "a6ac90cf434e27ce6f36886a80bc0cd285391b55bbe1951379474c62831d6d1c"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.7/ccli-linux-x64"
      sha256 "98549836d65d48a76d4903a630ba5a6f61f5006995a63f86f7b2ed6856b1ca17"
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
