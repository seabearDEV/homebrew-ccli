class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.5.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.2/ccli-macos-universal"
    sha256 "87f9fb0a7c0430c7c4e32084714c76dbf52eb98f671ed7fec7b446b46c5fec4e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.2/ccli-linux-arm64"
      sha256 "2092e9e0d2e6c8516c697bbfd6943809cc1d431ad7cc24b41390c5773efd94fa"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.2/ccli-linux-x64"
      sha256 "d06ecf4fb7472bef9abac156f5b78a3f7acb0efbd1debcda7104040f123a90bd"
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
