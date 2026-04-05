class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.0/ccli-macos-universal"
    sha256 "b66d967309f7e71c8f465ad867a3c6c95e095e9f7874b0ed7c609b89473ebcee"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.0/ccli-linux-arm64"
      sha256 "75aa37ae5d551534c35b15ee5d9875836f0970177303396a9e82af949c538f3e"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.4.0/ccli-linux-x64"
      sha256 "5994799d965405c64b969d24c65f597a716a11a86954f92cc60db8f916950cc8"
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
