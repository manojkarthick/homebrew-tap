# Generated with JReleaser 1.0.0-SNAPSHOT at 2022-01-27T11:15:34.023064823Z
class JreleaserPoc < Formula
  desc "PoC for JReleaser"
  homepage "https://github.com/manojkarthick/jreleaser-poc"
  version "0.2.5"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-aarch64-unknown-linux-gnu.zip"
    sha256 "8c29c7b0df125a8c8297d3108382ea141043f894b1ca99e4eacea3a2ff71cb4d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-x86_64-unknown-linux-gnu.zip"
    sha256 "f5c87c203eea8788ac55349b397557a453f78a5c21f04e812b62a4a7fe5bae25"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-aarch64-apple-darwin.zip"
    sha256 "30f631d1178e0ead29afbced74b9b3acd64321934297efd10452ac29fef0cb9a"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.5/jreleaser-poc-0.2.5-x86_64-apple-darwin.zip"
    sha256 "652d9ae237b2fce3a4469c11733edd3a1308bbac401f4b04252befd86f75a166"
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
