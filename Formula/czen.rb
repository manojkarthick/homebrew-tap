# Generated with JReleaser 1.0.0-SNAPSHOT at 2022-02-18T10:21:59.063585035Z
class Czen < Formula
  desc "Simple CLI tool to interactively create conventional commits"
  homepage "https://github.com/manojkarthick/czen"
  version "0.1.1"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/czen/releases/download/v0.1.1/czen-0.1.1-aarch64-unknown-linux-gnu.zip"
    sha256 "2b023ad3fddad621849ba211d9e316dd1cda2f2796620321bf105985d9442ee4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/czen/releases/download/v0.1.1/czen-0.1.1-x86_64-unknown-linux-gnu.zip"
    sha256 "8f720704e86c8f1d4850a9a1a5648a6b41ea3b315365f9d669d76b5a34829d59"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/czen/releases/download/v0.1.1/czen-0.1.1-aarch64-apple-darwin.zip"
    sha256 "c7608b4b835ff3338f55d0c7aeb6c6a1caf063dcc04372fe43b4b33ffa4e9698"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/czen/releases/download/v0.1.1/czen-0.1.1-x86_64-apple-darwin.zip"
    sha256 "19621777c880132c406797a39450f76176bc74bf181d9ebd50dbae9a08637048"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/czen" => "czen"
  end

  test do
    output = shell_output("#{bin}/czen --version")
    assert_match "0.1.1", output
  end
end
