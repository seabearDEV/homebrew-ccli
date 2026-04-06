class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.5.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.5.0/ccli-macos-universal"
    sha256 "34b95be235a8c2daaaac1138f05293b4706fce21ebcc273a843679e4356e424d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.5.0/ccli-linux-arm64"
      sha256 "aef99a628bc03a5e0b8bc55f463ce8fef675e7542cfeb739ce6d000f84eea1de"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.5.0/ccli-linux-x64"
      sha256 "439ea0e42844f0ae610ed36bd750230c41ad89133422ed4429ce683841c71619"
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
