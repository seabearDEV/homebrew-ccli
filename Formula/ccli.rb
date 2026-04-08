class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.10.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.10.0/ccli-macos-universal"
    sha256 "30305bdf3f2d4a20ceea678a924c11b4c4f42c31e5927545a751e5e088a59db6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.10.0/ccli-linux-arm64"
      sha256 "751fa22c1e27c2b868f9d4da4377f85f3b0a0fe8430d356f39601d4c2c5aa61c"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.10.0/ccli-linux-x64"
      sha256 "55b020c9522556e7ac54611a9e3119a96de7b978e94710682082ba423a6ad820"
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
