# Generated with JReleaser 1.13.0-SNAPSHOT at 2024-06-14T01:14:20.861133494Z

class Pqrs < Formula
  desc "Apache Parquet command-line tools and utilities"
  homepage "https://github.com/manojkarthick/pqrs"
  version "0.3.2"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.2/pqrs-0.3.2-aarch64-unknown-linux-gnu.zip"
    sha256 "8706cb0170b377dfb467fd0028f39fdba1aeb3b04ad6f9850b6821bbb2163a47"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.2/pqrs-0.3.2-x86_64-unknown-linux-gnu.zip"
    sha256 "51d471ee098eca5d9f6096a6c4b3324a3a8dd219cc79ae32607c2bb626453b5c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.2/pqrs-0.3.2-aarch64-apple-darwin.zip"
    sha256 "aa267087a2f90307e748ced5fb2f947720375f94ee01eb5f7c9724c11bf922d2"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.2/pqrs-0.3.2-x86_64-apple-darwin.zip"
    sha256 "4e58d9261e17f23079c9c9baca64f21c6c97c49c4325c5d9369cc186052c2e8c"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pqrs" => "pqrs"
  end

  test do
    output = shell_output("#{bin}/pqrs --version")
    assert_match "0.3.2", output
  end
end
