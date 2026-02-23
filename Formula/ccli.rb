class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.1/ccli-macos-universal"
    sha256 "8cecfeca6e4c79930cba635a54e78c2aa354a73100d89f37e116c6953fc746cf"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.1/ccli-linux-arm64"
      sha256 "e407e504019e816b1fb5fc299d99e55d9c1d6ee36b1c3e0a1a64d9a2a9a6ee2d"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.1/ccli-linux-x64"
      sha256 "d33ebb38979fa3970319ab2035f22d3e751352e1fe56bf235b5a90e1c019621e"
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
