class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.1.0/ccli-macos-universal"
    sha256 "07c808e326f8b668672e1ff8ebab2af4ba19352cfe1ffddc4847fdaa3173a8d9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.1.0/ccli-linux-arm64"
      sha256 "0c68c1ad4dd0d6af836df62ed4d4081e80beb2377fb32648015a506fd1077243"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.1.0/ccli-linux-x64"
      sha256 "9bb31b34db6a3057edcbdfdcfdb19346843c01f6e0ed1ec222480110f8049007"
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
