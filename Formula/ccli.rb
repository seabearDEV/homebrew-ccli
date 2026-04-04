class Ccli < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.0.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.0.0/ccli-macos-universal"
    sha256 "0076caf5bb0e52f5164a798e6e7cbf63aac06d07241caea1aab7a7751d297edf"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.0.0/ccli-linux-arm64"
      sha256 "5a6eb893170d64447919af82ea1cfae4fb5718cecc18b20de540678ee2703df8"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.0.0/ccli-linux-x64"
      sha256 "f8ed43fe64c027d4475b877a981bd779924f5e28746f6bd80b349968528166dc"
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
