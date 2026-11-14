class Recherche < Formula
  desc "Search your past Claude Code and Codex sessions"
  homepage "https://github.com/manojkarthick/recherche"
  version "0.1.0"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.1.0/recherche-0.1.0-aarch64-unknown-linux-gnu.zip"
    sha256 "4cc6ce9e98627a91c3f74488d0fb83de7789121e2c68828a471a64519a7ac0b7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.1.0/recherche-0.1.0-x86_64-unknown-linux-gnu.zip"
    sha256 "fe3b6e7a3f1c63adf2b254a365745f0deff25071aaae8497d0c3e4e227e5fd3e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.1.0/recherche-0.1.0-aarch64-apple-darwin.zip"
    sha256 "1dfe18d8542c39aecf771df629c0f4730e8df2d9052c55f135add5649242d6a0"
  end

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/recherche" => "recherche"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recherche --version")
  end
end
