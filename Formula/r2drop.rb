# typed: false
# frozen_string_literal: true

# Formula/r2drop.rb
# Installs the r2drop CLI binary from pre-compiled GitHub Release assets.
# Users install with: brew install --formula superhumancorp/tap/r2drop
class R2drop < Formula
  desc "CLI for uploading files to Cloudflare R2 storage"
  homepage "https://r2drop.com"
  version "0.1.7"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superhumancorp/homebrew-tap/releases/download/cli-v#{version}/r2drop-macos-arm64.tar.gz"
      sha256 "6910ace8ff1802222819fecf4a92bb6c4976f587eab4d21e57c35220c08723b7"
    end

    if Hardware::CPU.intel?
      url "https://github.com/superhumancorp/homebrew-tap/releases/download/cli-v#{version}/r2drop-macos-x86_64.tar.gz"
      sha256 "4ffff603018e5449253c0b138089f67ac81c14b2646316a201863d92fbed8e18"
    end
  end

  def install
    bin.install "r2drop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/r2drop --version")
  end
end
