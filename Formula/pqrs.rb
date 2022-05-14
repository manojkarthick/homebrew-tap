# Generated with JReleaser 1.1.0-SNAPSHOT at 2022-05-14T20:41:00.726693587Z
class Pqrs < Formula
  desc "Apache Parquet command-line tools and utilities"
  homepage "https://github.com/manojkarthick/pqrs"
  version "0.2.1"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.2.1/pqrs-0.2.1-aarch64-unknown-linux-gnu.zip"
    sha256 "286bb3d613543d7fec426cc67f82c3559147832dc7e72be87b5076889ffd3770"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.2.1/pqrs-0.2.1-x86_64-unknown-linux-gnu.zip"
    sha256 "3f8636b7616038de041a46813be14bb4980f7dfa3f513487e5d27af3aeb820c7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.2.1/pqrs-0.2.1-aarch64-apple-darwin.zip"
    sha256 "391d2c870217c59623c0075c1fc161c7355928b3bca2e2d5ecf8a82c76f0215d"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.2.1/pqrs-0.2.1-x86_64-apple-darwin.zip"
    sha256 "3ba59a58c6b08bc2aff364eae46f35636c275668fa663414d454ef806cf0475b"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pqrs" => "pqrs"
  end

  test do
    output = shell_output("#{bin}/pqrs --version")
    assert_match "0.2.1", output
  end
end
