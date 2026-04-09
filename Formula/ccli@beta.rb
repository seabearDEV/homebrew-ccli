class CcliAtBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.0/ccli-macos-universal"
    sha256 "68f7e2b5113c674b674400b87b8c77d80b8f33eb337376fa058663c4b3d3788c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.0/ccli-linux-arm64"
      sha256 "371d4a9bd1c0283c8d76e3bf7f53580a7eaa396221e9b8cb56ccb712f4950f5a"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.0/ccli-linux-x64"
      sha256 "d122ec74fe713ab7bb0706cfdce985962890410262c06189ca8f923412ad83e5"
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
