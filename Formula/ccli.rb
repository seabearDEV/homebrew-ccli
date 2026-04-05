class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.4.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.1/ccli-macos-universal"
    sha256 "74dc73693ea0f4381e07806b6a5eb29f66daa56decd272fca54469c96c2ccc59"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.1/ccli-linux-arm64"
      sha256 "01ffbb13f643185fff295087a61223774d4ee0129df3731732a06d270e476500"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.1/ccli-linux-x64"
      sha256 "9fc5bb186e356cd81937b9560b19b50336b044aa4eec17b85e123f9c46218722"
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
