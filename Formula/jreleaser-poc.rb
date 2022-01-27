# Generated with JReleaser 1.0.0-SNAPSHOT at 2022-01-27T10:39:14.07928752Z
class JreleaserPoc < Formula
  desc "PoC for JReleaser"
  homepage "https://github.com/manojkarthick/jreleaser-poc"
  version "0.2.5"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-aarch64-unknown-linux-gnu.zip"
    sha256 "7595c40df3b340b3da78b7b50fec1ea98f3ca350217b080ca0ac4669b50d874c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-x86_64-unknown-linux-gnu.zip"
    sha256 "45e57d6016ccc64bc6b6b277ac53a44cca39c71df67955493532a9e619166bd5"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-aarch64-apple-darwin.zip"
    sha256 "59bfaa35d14deb958004c997d935f0d022532b8f5e2d7da2b43936a2a6696ae6"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-x86_64-apple-darwin.zip"
    sha256 "acd08e351e57b1db848e7b6fa263c4eda10a9453ee32c864748470341258ec55"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/jreleaser-poc" => "jreleaser-poc"
  end

  test do
    output = shell_output("#{bin}/jreleaser-poc --version")
    assert_match "0.2.5", output
  end
end
