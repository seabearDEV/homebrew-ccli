class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.6.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.6.0/ccli-macos-universal"
    sha256 "ed0403adc147ceb0adc652b5c2aa8d9b7b4cf9cfc0c706ef8ca426150e8ddfc0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.6.0/ccli-linux-arm64"
      sha256 "418ef99898e38f5c514b87cf127194deb984dc14b3465a9d962843a648569960"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.6.0/ccli-linux-x64"
      sha256 "4fd2be34be313d72897a74968a9ce308e888f1cb5c5c9eefbd23ff4121eae162"
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
