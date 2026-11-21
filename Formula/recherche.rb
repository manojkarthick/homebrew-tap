class Recherche < Formula
  desc "Search your past Claude Code and Codex sessions"
  homepage "https://github.com/manojkarthick/recherche"
  version "0.3.0"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.3.0/recherche-0.3.0-aarch64-unknown-linux-gnu.zip"
    sha256 "faf5719ba4af0f874b39be4df02b7ed5ee49066a29b5d5bb1c7f5af7dd81b885"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.3.0/recherche-0.3.0-x86_64-unknown-linux-gnu.zip"
    sha256 "0bf831a7d176949b639e03122fbeacdac857ea9b18e97ce6890e67399fbd356d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.3.0/recherche-0.3.0-aarch64-apple-darwin.zip"
    sha256 "7f1761ac42fd9d9bfa15d756039d99a7b5a4d3b22134d60dc7f9360ac011897a"
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
