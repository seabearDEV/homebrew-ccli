class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.6.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.6.1/ccli-macos-universal"
    sha256 "b9d38cd6375e3400f3196d39c6028297aeb393415b48c9cff0ec70c782a6a00c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.6.1/ccli-linux-arm64"
      sha256 "5dd614985e64cf10a4b31188a0a568ab0b9cd2b4699948a53308838f69d54a42"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.6.1/ccli-linux-x64"
      sha256 "00a62e6c98663a3bcf68db9f53f0b1d9af8b04a93a85c00926228fbf54c284cd"
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
