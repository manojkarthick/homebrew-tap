# Generated with JReleaser 1.13.0-SNAPSHOT at 2024-06-14T00:37:49.166974247Z

class Pqrs < Formula
  desc "Apache Parquet command-line tools and utilities"
  homepage "https://github.com/manojkarthick/pqrs"
  version "0.3.1"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-aarch64-unknown-linux-gnu.zip"
    sha256 "1456dc8660e74b6ec5bd50fde88d31b28700d5fbc2b57607fead6a629d1c7076"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-x86_64-unknown-linux-gnu.zip"
    sha256 "b10e81a1f3901b7379f1ffa432b4e7cd228b65cb3b85fb0eabe0d27d5b84c4fd"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-aarch64-apple-darwin.zip"
    sha256 "7a7df5b03c31170d601a6e07ea01d0780eefc183368af86cf3157f29d459e953"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-x86_64-apple-darwin.zip"
    sha256 "04b806b91d9249159e8e9461883cde783f3e803cb5b34d64273611df9bde5de0"
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
