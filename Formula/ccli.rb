class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1/ccli-macos-universal"
    sha256 "5901ba60c9c45f22aee9745c902545b13397f0e6154a4af30055f4f5963225e6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1/ccli-linux-arm64"
      sha256 "facffcb09f5240703b21a9a69bbc7d68f08f468cbffbd4bf781ed8adb4f0bc93"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1/ccli-linux-x64"
      sha256 "869a65b99357993d310dd3d6e845586738b1baa54b8791b072d7c8d7e0464d69"
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
