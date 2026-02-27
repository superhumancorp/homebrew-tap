# typed: false
# frozen_string_literal: true

# Formula/r2drop.rb
# Installs the r2drop CLI binary from pre-compiled GitHub Release assets.
# Users install with: brew install --formula superhumancorp/tap/r2drop
class R2drop < Formula
  desc "CLI for uploading files to Cloudflare R2 storage"
  homepage "https://r2drop.com"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superhumancorp/homebrew-tap/releases/download/cli-v#{version}/r2drop-macos-arm64.tar.gz"
      sha256 "190bc0b4dcdc80f47bfb4edcefa5c368550bb85a93411b58d2d0d77e818f6273"

      def install
        bin.install "r2drop"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/superhumancorp/homebrew-tap/releases/download/cli-v#{version}/r2drop-macos-x86_64.tar.gz"
      sha256 "2ae58db8746557622169f6a6c41da9aa5a4cb80853eb7cf5845f157ef8c8a6fd"

      def install
        bin.install "r2drop"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/superhumancorp/homebrew-tap/releases/download/cli-v#{version}/r2drop-linux-x86_64.tar.gz"
      sha256 "2d4588afc577e70158ee5656abc05d90ddec90550e07bce505e68a2f21cc11fb"

      def install
        bin.install "r2drop"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/superhumancorp/homebrew-tap/releases/download/cli-v#{version}/r2drop-linux-arm64.tar.gz"
      sha256 "7044ff7a5afb68398f5a12e9e6cadf178c64e0ab30035b2e8b1e07c3ba7dd901"

      def install
        bin.install "r2drop"
      end
    end
  end

  livecheck do
    url "https://github.com/superhumancorp/homebrew-tap/releases"
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/r2drop --version")
  end
end
