class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.0/ccli-macos-universal"
    sha256 "79913dd6f0d69574fbd3a3ca9bdb0c08a6bbcfe7136ded10eb0bcd0f450f43c2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.0/ccli-linux-arm64"
      sha256 "22c33d9399596661cceb513af626e49e744732344e7a5cdd2adadae8605d8b20"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.5.0/ccli-linux-x64"
      sha256 "6f630ed07f57e773343c2950da5b34136e7aaa8d830a817794f363710b6bddf3"
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
