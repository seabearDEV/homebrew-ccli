class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.3.0/ccli-macos-universal"
    sha256 "bb7c7554f047e3b9501118e8319b503c8d619982b129e7f817a61902592f04a3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.3.0/ccli-linux-arm64"
      sha256 "6e22c4ee9081cd3d269bdfba705d0803f80e0b435a3efb9d819473cbaf2d9cd3"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.3.0/ccli-linux-x64"
      sha256 "79527fff319c19074dcb3ee6ed150b45097133b50db192128e58cb699b6fa383"
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
