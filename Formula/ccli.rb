class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.8.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.8.0/ccli-macos-universal"
    sha256 "3adf6a3cecffbc12ff7262c3bf882cd28f079d35728bbbf22d32f6483de3d620"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.8.0/ccli-linux-arm64"
      sha256 "1f5182dac6003a274aa3fdd5b82a7597f2935f759953bee28b2f3a5d10a7b26d"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.8.0/ccli-linux-x64"
      sha256 "533e5b23df1f21fcad4454d6d41ecfb98b5156a736ef33f576e6ca1bdeda1b60"
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
