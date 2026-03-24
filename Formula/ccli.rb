class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.5.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.1/ccli-macos-universal"
    sha256 "cf0c92e9068d16ce4212eeb89725a641aaa2f433533e0daded391fc41f5fc9f0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.1/ccli-linux-arm64"
      sha256 "2b1658c23a36a2956920ea86a733e74b49f63bff867f3882517b4bc1ea7c48ca"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.1/ccli-linux-x64"
      sha256 "d96b04b24f5ab4e26507d5af2155d89ba9e064ed125b3fc650754111617f9879"
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
