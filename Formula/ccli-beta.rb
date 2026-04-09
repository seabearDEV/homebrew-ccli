class CcliBeta < Formula
  desc "Command-line information store for quick reference of frequently used data"
  homepage "https://github.com/seabearDEV/codexCLI"
  version "1.11.1-beta.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.5/ccli-macos-universal"
    sha256 "7946e3e1648f46bc94093e6149f597df0a2922a61ad8a744db939781152b9334"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.5/ccli-linux-arm64"
      sha256 "007f22d3977989924c1abf66106cfd37d62508878da2070b7a7c3fb3c229c3fe"
    else
      url "https://github.com/seabearDEV/codexCLI/releases/download/v1.11.1-beta.5/ccli-linux-x64"
      sha256 "5d5354e72e6e99efbf54f13fa93632e435cf2266828bde141a88e55e0e518710"
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
