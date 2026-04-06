class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.7.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.7.0/ccli-macos-universal"
    sha256 "dd3d1b5fe22acfaffd5e8a21fcac9f8b24890aceeaebbfc8bc5d2807fdc36102"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.7.0/ccli-linux-arm64"
      sha256 "fd8cb1627ea26eaa249c97847bd2a02ffc5f54ceaffd3080dfd6bad1b4855e2f"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.7.0/ccli-linux-x64"
      sha256 "4d039ce3c3707f4b7ae482417abd97a53c2ea0506b448a988ccbb9b8790080e4"
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
