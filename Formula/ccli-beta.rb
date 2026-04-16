class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.12.2-beta.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2-beta.1/ccli-macos-universal"
    sha256 "82a503c13ca063c7cdb0e98b80800c3a6899d98051a721c759d9aa61130ac8e9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2-beta.1/ccli-linux-arm64"
      sha256 "61dade0e1422e438f2bfa0e6282374e37af353848ea3d6e467de72da0d016e1a"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2-beta.1/ccli-linux-x64"
      sha256 "5be253a330c50ba74114635103f7b5107877d62431baade5f52aae794ccdc186"
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
