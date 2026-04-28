class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.0.0-debug.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.0.0-debug.0/ccli-macos-universal"
    sha256 "4a06d641bb941178cd86919b1f5b9b8c4a95ad46b2c066b894d3b561aedc8d6e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.0.0-debug.0/ccli-linux-arm64"
      sha256 "0c1b5ded39ceacb67b8c1a477a85b4f979022b20cc7fc3f366b9aaa5568ef4b7"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.0.0-debug.0/ccli-linux-x64"
      sha256 "df2dabf51595eb3bc4c54795101c124fcde4e960acdb6138b73a2e65171fbad1"
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
