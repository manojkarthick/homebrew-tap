# Generated with JReleaser 1.13.0-SNAPSHOT at 2024-06-14T00:57:07.436073983Z

class Pqrs < Formula
  desc "Apache Parquet command-line tools and utilities"
  homepage "https://github.com/manojkarthick/pqrs"
  version "0.3.1"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-aarch64-unknown-linux-gnu.zip"
    sha256 "9a4994f4a57a9918d8831788a989538aefeb4f3c27b5c18e9006286f4f83717b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-x86_64-unknown-linux-gnu.zip"
    sha256 "3019ff3adcad847d4a725eecca9f6e02fd00deeae38aabec949b15588d2f2004"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-aarch64-apple-darwin.zip"
    sha256 "72eb1d11b3b2606432abeae495ce7f96285d782a2797ba9ee9768b599de77e63"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-x86_64-apple-darwin.zip"
    sha256 "23c64992ffa84b3ad0f427de7e727b49d4495e7b9dedb9a39bf6c7c7fce9cf57"
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
