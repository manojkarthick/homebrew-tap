# Generated with JReleaser 1.7.0-SNAPSHOT at 2023-05-10T02:53:48.903767908Z
class Pqrs < Formula
  desc "Apache Parquet command-line tools and utilities"
  homepage "https://github.com/manojkarthick/pqrs"
  version "0.3.0"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.0/pqrs-0.3.0-aarch64-unknown-linux-gnu.zip"
    sha256 "f2184bccf6f6722611077ba32fbd7f5ee115f0c5869435a485e2a2e2ce4650eb"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.0/pqrs-0.3.0-x86_64-unknown-linux-gnu.zip"
    sha256 "40bed5fd6ede6e59bd2ef6eab6ecd494fee0f442bfa378c6be799c0177bc5c10"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.0/pqrs-0.3.0-aarch64-apple-darwin.zip"
    sha256 "674d3c6f4c5165502684e88204fceff0fb8e4964e9052ea9a710aa785a7bcafe"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.0/pqrs-0.3.0-x86_64-apple-darwin.zip"
    sha256 "f72e5a8dd5f3e540232db013483f90f30ed06fd6ed088e33b4009a19b14e51d6"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pqrs" => "pqrs"
  end

  test do
    output = shell_output("#{bin}/pqrs --version")
    assert_match "0.3.0", output
  end
end
