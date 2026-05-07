class RvrBeta < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "0.0.0-debug.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v0.0.0-debug.1/rvr-macos-universal"
    sha256 "f6d96f91b69c0079b1cadc408c0a74257a5638c49940454740da4de032a1e97c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v0.0.0-debug.1/rvr-linux-arm64"
      sha256 "60560ae7b75281c794abd8965116c6ead1dff84633209e743cca2998af307a2a"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v0.0.0-debug.1/rvr-linux-x64"
      sha256 "52ef6789bc61157882aa0d2023bb470cd78470d37bc449330ecfd763e62421eb"
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
