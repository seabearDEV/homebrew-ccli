class RvrBeta < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.0.0-beta.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.0/rvr-macos-universal"
    sha256 "5a6dcd9a9587b408eb7b3c0d5d38f1b93f45892282074295fe55ec0913724e6a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.0/rvr-linux-arm64"
      sha256 "76fd293222b9b3f9c9bb734326769b7f9a2217ce070a8e06164aed656f1e3d38"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.0/rvr-linux-x64"
      sha256 "b21eaf8b09988e156c7e3ccde5342d3ab2595549b5d65e03476db1438f16f3ea"
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
