class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.2.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.2.1/ccli-macos-universal"
    sha256 "b79e282bc4d686e15faa28d77f6b0322aeecb0d00bb1f240d9a140a7614928b7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.2.1/ccli-linux-arm64"
      sha256 "c245844da766f9b6fd6a5392b060d5eac208c9f7b6cad16edfc5cc9bb3f35103"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.2.1/ccli-linux-x64"
      sha256 "1ea0a1d0b2e4854ca427f8f247f1287e2101ea10846f394d8e2ee2d48ad9c834"
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
