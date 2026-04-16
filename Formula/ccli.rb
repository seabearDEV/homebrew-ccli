class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.12.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.0/ccli-macos-universal"
    sha256 "599ed684bedcf24e41027cb2fa6c8ac39486ce7df266f86326717f661e09b322"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.0/ccli-linux-arm64"
      sha256 "e3e30f20677f876eca2348ccf8f5b7c5c041ead053618a4746cbfabb48bcb9c7"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.12.0/ccli-linux-x64"
      sha256 "7471a79ebea40a84433ce47e5639268472d550983076efb9f7faee3e37b9438d"
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
