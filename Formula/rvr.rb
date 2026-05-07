class Rvr < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.0.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0/rvr-macos-universal"
    sha256 "c7d4ffcf9b6cba6d4b23af8c0f664b32f945b77faf7f347d313552350ad63d7e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0/rvr-linux-arm64"
      sha256 "3ebaac2f3d45eb14a36a11b45758ccad8e7bbccb3fc59422886c1f92b9ff075b"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0/rvr-linux-x64"
      sha256 "731d2b67d697599aa2223b28938d57cd31e2a2cc377ba6bca1ec96705afabb96"
    end
  end

  def install
    binary = Dir.glob("rvr-*").first
    bin.install binary => "rvr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rvr --version")
  end
end
