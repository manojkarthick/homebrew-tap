# Generated with JReleaser 1.0.0-SNAPSHOT at 2022-01-27T04:31:33.327697385Z
class JreleaserPoc < Formula
  desc "PoC for JReleaser"
  homepage "https://github.com/manojkarthick/jreleaser-poc"
  version "0.2.2"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.2/jreleaser-poc-0.2.2-aarch64-unknown-linux-gnu.zip"
    sha256 "cd7820c4936ca8fcfdfcbfc63ff703133a3ab47d58c3afd519baf69705a4bac8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.2/jreleaser-poc-0.2.2-x86_64-unknown-linux-gnu.zip"
    sha256 "e191a6c95007d8358f10e6c13dfb06f44b82108a3c7502e48f845b64a71442f2"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.2/jreleaser-poc-0.2.2-aarch64-apple-darwin.zip"
    sha256 "2a727acb70fb774d73c8ece3b46f21c2d2305a8dd4c6626cfc1ae230d469eae2"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/jreleaser-poc/releases/download/v0.2.2/jreleaser-poc-0.2.2-x86_64-apple-darwin.zip"
    sha256 "785c769421ac91f27329eedec81250c9ea9edcaee7b0d82d9d69ce7df47eea8d"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "jreleaser-poc" => "#{libexec}/bin/jreleaser-poc"
  end

  test do
    output = shell_output("#{bin}/jreleaser-poc --version")
    assert_match "0.2.2", output
  end
end
