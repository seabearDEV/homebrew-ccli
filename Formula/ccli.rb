class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.6.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.6.0/ccli-macos-universal"
    sha256 "e8d39ce9020d4ce3f2f035906d153596d8d3fed34e4d3bd4ed2e2d59e1777f59"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.6.0/ccli-linux-arm64"
      sha256 "bdf98afb6040846f5e5cb818e5ffb31f3f631ea5fbdd0eb318751b872679a180"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.6.0/ccli-linux-x64"
      sha256 "49bf840d7030c8d440993cf3187709673345448aacd626a55a732ba0a3b78554"
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
