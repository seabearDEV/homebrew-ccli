class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.5.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.5.1/ccli-macos-universal"
    sha256 "b6bf9484b49df49f5bc239380e0e0d4e870b59385804e6a41019983db6a232cb"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.5.1/ccli-linux-arm64"
      sha256 "8cf6864886aadc0b46505b12624d57b225f0e4825a4c94665d126569e20f31c6"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.5.1/ccli-linux-x64"
      sha256 "9168fdad823b6f7681e9600cc0bfc55126e69cff893573692010b0967b8f6702"
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
