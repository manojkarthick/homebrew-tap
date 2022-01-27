# Generated with JReleaser 1.0.0-SNAPSHOT at 2022-01-27T04:47:57.273662816Z
class JreleaserPoc < Formula
  desc "PoC for JReleaser"
  homepage "https://github.com/manojkarthick/jreleaser-poc"
  version "0.2.5"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-aarch64-unknown-linux-gnu.zip"
    sha256 "9dde8c20769f238ddad95bdfd1a8fafc0b9d924eca78d2210c33191ca241bf99"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-x86_64-unknown-linux-gnu.zip"
    sha256 "5970a033bd14b3838a2a721db64681e81ada52fbc86528310640e20e16b69b18"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-aarch64-apple-darwin.zip"
    sha256 "2d2c523fd9b040c9ed2588484bf0ec182396b5fb45a0277c56f38a2812abdf32"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-x86_64-apple-darwin.zip"
    sha256 "300e30da20bc9988288ede5f8068de30b3b806bb58f0745820801b61d9947f95"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "jreleaser-poc" => "#{libexec}/bin/jreleaser-poc"
  end

  test do
    output = shell_output("#{bin}/jreleaser-poc --version")
    assert_match "0.2.5", output
  end
end
