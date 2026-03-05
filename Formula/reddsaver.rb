class Reddsaver < Formula
  desc "CLI tool to download media from Reddit"
  homepage "https://github.com/manojkarthick/reddsaver"
  version "1.0.0-rc6"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/reddsaver/releases/download/v1.0.0-rc6/reddsaver-1.0.0-rc6-aarch64-unknown-linux-gnu.zip"
    sha256 "0b776c3285d0258a8fb117288c45a9eaaf280d3aae4e29580e822f561819b41d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/reddsaver/releases/download/v1.0.0-rc6/reddsaver-1.0.0-rc6-x86_64-unknown-linux-gnu.zip"
    sha256 "a85a446718d6b583a0076b2720e22550bf4383b4a7b6035b3f47c03b555c607c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/reddsaver/releases/download/v1.0.0-rc6/reddsaver-1.0.0-rc6-aarch64-apple-darwin.zip"
    sha256 "d2d5f8d4e0c59993c8012db6191a2247fbc1f77757143a9f6dbb5a32dc24a8de"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/reddsaver/releases/download/v1.0.0-rc6/reddsaver-1.0.0-rc6-x86_64-apple-darwin.zip"
    sha256 "fa46835b6547752735f694fd1ed0c78b3428e74d34cf98d0c076349b626110ee"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/reddsaver" => "reddsaver"
  end

  test do
    output = shell_output("#{bin}/reddsaver --version")
    assert_match "1.0.0-rc6", output
  end
end
