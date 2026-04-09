class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.8/ccli-macos-universal"
    sha256 "4dc86fa56ca5b27bb97b551ce3d327731157c55e1a06f83c1de9675e84b9461a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.8/ccli-linux-arm64"
      sha256 "1224d14d23114c5d56894035d9c40837822f8b4c256b139197023e95b3b47027"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.8/ccli-linux-x64"
      sha256 "f0c7448052d6165c4638611a0e53267578cf164f1c1fd2dac9d557be608d4040"
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
