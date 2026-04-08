class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.9.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.2/ccli-macos-universal"
    sha256 "c983d8ad66abd73855a533db338f02578c7abb76df35e788760aa08f845bde55"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.2/ccli-linux-arm64"
      sha256 "c6820f652916de280c1766c7dcbdb3408e00876f052105e3dcab0106fa30070b"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.2/ccli-linux-x64"
      sha256 "b1fe407f48fbdfd5285a3416096264293ef57f32c8f1990ab98b6e7ddd597f20"
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
