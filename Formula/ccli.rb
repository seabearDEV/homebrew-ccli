class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.12.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2/ccli-macos-universal"
    sha256 "1eed1da780fd3263e7e23a9b7a3966a08a91c854bdd63fd24de8a44a2bc33bd0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2/ccli-linux-arm64"
      sha256 "c0248983bff536b0b995d8661678debe8282f8b4af05e1e9db33e10911c37fc0"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.2/ccli-linux-x64"
      sha256 "37633c0af207442ad90b644f1d18eadc0ff5c90495b4f8783cd8a6aeb6ceb6b1"
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
