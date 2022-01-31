# Generated with JReleaser 1.0.0-SNAPSHOT at 2022-01-31T07:26:26.526816879Z
class Czen < Formula
  desc "Simple CLI tool to interactively create conventional commits"
  homepage "https://github.com/manojkarthick/czen"
  version "0.1.0"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/czen/releases/download/v0.1.0/czen-0.1.0-aarch64-unknown-linux-gnu.zip"
    sha256 "2b8d466e54804840d49bd857f171d3d759895d5681abe922d46a711ddcde6d94"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/czen/releases/download/v0.1.0/czen-0.1.0-x86_64-unknown-linux-gnu.zip"
    sha256 "6b02b95f69401f09f4ae674b0dd1342f06cbfe42d4a05884382998af70b42e40"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/czen/releases/download/v0.1.0/czen-0.1.0-aarch64-apple-darwin.zip"
    sha256 "03baac1bd88d5a7bcbe161e30c6d120a2f5b9a4b9101eef8da82ba7c6bec9424"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/czen/releases/download/v0.1.0/czen-0.1.0-x86_64-apple-darwin.zip"
    sha256 "13d97463b37dc8031a6c08cb5117a9951ee6e1b9b1c4c0edf90fcee6b5ac7cab"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/czen" => "czen"
  end

  test do
    output = shell_output("#{bin}/czen --version")
    assert_match "0.1.0", output
  end
end
