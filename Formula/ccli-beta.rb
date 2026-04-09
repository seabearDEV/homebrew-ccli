class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.6/ccli-macos-universal"
    sha256 "7bf8b7db0710ba63600f7e749f49fd3c70b5a2802763569faa8c962fcb16cff6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.6/ccli-linux-arm64"
      sha256 "92a4ee94ad305d7c4e225941ab75badfa2b437f5b901074bf9caff79672e97cb"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.6/ccli-linux-x64"
      sha256 "b9fb820e56fee95660bba23e9f1f93c4300ae7a406d64657a1485e039ef02738"
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
