class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.12.2-beta.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2-beta.0/ccli-macos-universal"
    sha256 "8688375a91860869a371e66f7782c1bc8493ad34e4ed3192746404e64178b68d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2-beta.0/ccli-linux-arm64"
      sha256 "e222fc5754e8033c1fa735e24a4baaeba0a8e06f3fd544c6101186ce833de5c4"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2-beta.0/ccli-linux-x64"
      sha256 "6e71b87b793ddd2ebe64c32c6998b9ede542e34980ddc22660e9709a6f58ec1a"
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
