class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.9.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.0/ccli-macos-universal"
    sha256 "c4386db2802397be542f954b6c86371bb910df45a620f09677ac9e4ea851c7e3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.0/ccli-linux-arm64"
      sha256 "a7f3e540c1bf784e13194eb6b206180d81a549eb8632b117d4ecfdeea1ad788c"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.9.0/ccli-linux-x64"
      sha256 "3f3010a59f1c62fb3698326ad4dcced48849f77dba1d0d8863cdcb43d159d7ef"
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
