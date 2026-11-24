class Recherche < Formula
  desc "Search your past Claude Code and Codex sessions"
  homepage "https://github.com/manojkarthick/recherche"
  version "0.6.0"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.6.0/recherche-0.6.0-aarch64-unknown-linux-gnu.zip"
    sha256 "5cd821a1818b9e2eaeb7084165e7893a7c9fc579483c197fd5ee61fc3ce24e49"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.6.0/recherche-0.6.0-x86_64-unknown-linux-gnu.zip"
    sha256 "c800ca0618d744cc59b0fe58c5cfcb88429c69de951d60696bac8f15fe2e7303"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.6.0/recherche-0.6.0-aarch64-apple-darwin.zip"
    sha256 "276d0eac87cf5e74976500882018cf1709bd6a6772681cb2d34614fbea9553d8"
  end

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/recherche" => "recherche"
  end

  service do
    run [opt_bin/"recherche", "serve"]
    keep_alive true
    process_type :background
    log_path var/"log/recherche.log"
    error_log_path var/"log/recherche.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recherche --version")
  end
end
