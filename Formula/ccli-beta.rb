class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.2/ccli-macos-universal"
    sha256 "dd24c3d3198cd3514ea109d87036924b98bcce09166a1922b6ede76488b9f3b4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.2/ccli-linux-arm64"
      sha256 "fbc74c2510ef202941c62d12d0d30a41a5f9bfbd6d897cd607d4322c0687a279"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.2/ccli-linux-x64"
      sha256 "b3346e80712ddcf0f4642efc0476c78cf25b90a8bc3d1d102e4cb0b008216909"
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
