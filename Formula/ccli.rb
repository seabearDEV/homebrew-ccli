class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.8.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.8.0/ccli-macos-universal"
    sha256 "ff990895df5b16df99cb8359bc2c4377c2201c40f014720c0e09f724b24e506b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.8.0/ccli-linux-arm64"
      sha256 "a91e026c77c481473b6a8ef3ca906104f0663a1758b8e13c7c64db8d6f8f7fce"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.8.0/ccli-linux-x64"
      sha256 "c1b50df561e8b2031f06f31a191b4dda1e09ce345f95cff8402cdf6a52ed01c4"
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
