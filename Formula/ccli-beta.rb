class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.3/ccli-macos-universal"
    sha256 "d962e9220f62763c6b8701ec1578b832547a440d865c5155cadd1df8da045cf6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.3/ccli-linux-arm64"
      sha256 "0064109abedb18fb2e76f80210a46f83a18b9c8b4076e97bc80e260208fb28fe"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.3/ccli-linux-x64"
      sha256 "988bc28cf96420f37cdd59fe4404a2e18b401e2f6f680995c6343d75f0edbcd4"
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
