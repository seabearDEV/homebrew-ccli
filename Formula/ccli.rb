class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.9.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.1/ccli-macos-universal"
    sha256 "48fe4e3ea18cd69ae8349d1d7f559ad2a268c3010b69da9d20abb2e234c3ff3b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.1/ccli-linux-arm64"
      sha256 "155b1509e6970eedc9ac123d7a01c3d1ab6a061f1a4d4525461db3e7635cd319"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.1/ccli-linux-x64"
      sha256 "50195e4d586435bd7a7fc622841aa9dcea8c61c44fdb08f1269f7ba345c7adbc"
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
