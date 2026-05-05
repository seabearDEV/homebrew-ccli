class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.14.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.14.0/ccli-macos-universal"
    sha256 "89e6d765b120d4c7e5015d98cfad20106eeda137ff35aa675fa421e152646e96"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.14.0/ccli-linux-arm64"
      sha256 "04cb7c2a8bf28287ee9375bce0ce7834403eabd685782497327c338c1cfba544"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.14.0/ccli-linux-x64"
      sha256 "186fefb1ab59caa15e259c2beeba4ce46fcfb74c50cbabeaf2e38f17625dfe75"
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
