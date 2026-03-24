class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.4.0/ccli-macos-universal"
    sha256 "315d45149c240d9297fe1ad5e135903f62f10ff2f6fb25dfbc4c32dd677111aa"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.4.0/ccli-linux-arm64"
      sha256 "bb00529db8f8838842b393a52d728c5bc023c91a92d097a9891c48702f7f47b4"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.4.0/ccli-linux-x64"
      sha256 "6987d442a372f4b44bd7f42d70f6f59ab618640b3241d9ac73277e69e7c3a512"
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
