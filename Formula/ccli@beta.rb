class CcliAtBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.1/ccli-macos-universal"
    sha256 "c5accd9c757fd7850520b67f8c35233a36fcbcbd8dde147c6c5fe6263f025961"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.1/ccli-linux-arm64"
      sha256 "467c7a498edfe46234392e8d8873c185fcb3857c17b83c73bdfaca140fb23f4d"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.1/ccli-linux-x64"
      sha256 "b69272952b257908a466a68cabd83da8b5944bfb6afa606668a258167f0fd022"
    end
  end

  def install
    binary = Dir.glob("ccli-*").first
    bin.install binary => "ccli-beta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccli-beta --version")
  end
end
