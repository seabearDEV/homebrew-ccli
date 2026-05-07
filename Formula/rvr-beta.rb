class RvrBeta < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.0.0-beta.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.2/rvr-macos-universal"
    sha256 "ceb29c6335c2d564352d9cd5cab67acf2fe560a3d907e8605dbe0323d6dff7a6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.2/rvr-linux-arm64"
      sha256 "c369692080b12923571961949b180e4b9c1f7b17335b63bc0ce76cfe27d8bc65"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.2/rvr-linux-x64"
      sha256 "a649490cdd0f1da225c32bd68f5249cab1187e4d3d577684a9d71d7f6d675604"
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
