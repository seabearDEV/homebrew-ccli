class RvrBeta < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.0.0-beta.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.1/rvr-macos-universal"
    sha256 "65f961a785b82537f334d559d23fbe4c710b3e98d093db4e77272626a6d4a8d1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.1/rvr-linux-arm64"
      sha256 "7ff9e358a4dfd9e37c82a8c502e02165ae2d7ebf4e8de2dd18d87527db339b60"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.1/rvr-linux-x64"
      sha256 "d3d5cca3df448684f6dc9e62f9beefaa5a75d73faf5e188713f5a9e374a3949a"
    end
  end

  def install
    binary = Dir.glob("rvr-*").first
    bin.install binary => "rvr-beta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rvr-beta --version")
  end
end
