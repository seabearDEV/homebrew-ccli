class RvrBeta < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.0.0-beta.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.3/rvr-macos-universal"
    sha256 "e7dced002f28777c8acb1303d158d9cd605cfa57f229562e2b0c8262c50608ae"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.3/rvr-linux-arm64"
      sha256 "9921c2e82397e88a1d84d63cf224b795b11428b7efa7a8f4667fd15967419bd2"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.0.0-beta.3/rvr-linux-x64"
      sha256 "0eb05ddb5940a7195ccbe1d03a09e621ffcbdb8afac8ea0bc5bad47d7a80d76d"
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
