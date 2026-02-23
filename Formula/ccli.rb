class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "0.2.1-rc.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.1-rc.3/ccli-macos-universal"
    sha256 "d2a81ab3aca07608e06b5b219d4c627d5af02b146373bb01372d98702604b9b9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.1-rc.3/ccli-linux-arm64"
      sha256 "3bc5be079eea759c88cbe82cc5413b4f147ea5139d104459d8b6bef333f6cdf6"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v0.2.1-rc.3/ccli-linux-x64"
      sha256 "dda30f77a7bed87e98c31fe044add6a23055afec36ee0bbc0a2e220b2a1567f8"
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
