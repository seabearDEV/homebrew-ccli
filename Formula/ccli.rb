class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.7.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.7.0/ccli-macos-universal"
    sha256 "0e9aa5b9c192485b49258f5507d4c99c70ecadfbe65699ba7e53c4b74be48aea"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.7.0/ccli-linux-arm64"
      sha256 "fe1d8513742e9684ecfd6ed6f42eba5a61747f4a674bfdf5cd72b35ab9be807b"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.7.0/ccli-linux-x64"
      sha256 "84ae43cf4a36ff09ef7bc9a5fe488bbcc85df47e195fe085273243f826205494"
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
