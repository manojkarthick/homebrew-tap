# Generated with JReleaser 1.7.0-SNAPSHOT at 2023-05-27T21:18:45.6476103Z
class Pqrs < Formula
  desc "Apache Parquet command-line tools and utilities"
  homepage "https://github.com/manojkarthick/pqrs"
  version "0.3.1"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-aarch64-unknown-linux-gnu.zip"
    sha256 "d1c5c74ebde7b24178de780e00e6d155a599f1fae928f59b19f8c3b158adb7d9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-x86_64-unknown-linux-gnu.zip"
    sha256 "329ed189fecb7e2919f8013db7b746905d0c735abc42048dec3f7695a84f732c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-aarch64-apple-darwin.zip"
    sha256 "1b8394eef4db468b364ac4c419924021de267d9e424aa29f57c2ed86c7bb9342"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-x86_64-apple-darwin.zip"
    sha256 "39101bffccc762138c913ed29ac2a229816b9a4acfec239e5533714a531f4e42"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pqrs" => "pqrs"
  end

  test do
    output = shell_output("#{bin}/pqrs --version")
    assert_match "0.3.1", output
  end
end
