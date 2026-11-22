class Recherche < Formula
  desc "Search your past Claude Code and Codex sessions"
  homepage "https://github.com/manojkarthick/recherche"
  version "0.5.0"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.5.0/recherche-0.5.0-aarch64-unknown-linux-gnu.zip"
    sha256 "a5c79ee69f1f7f8b8564397306432a401dd0e511af5bdd16a5f8d1d7d29f4b7c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.5.0/recherche-0.5.0-x86_64-unknown-linux-gnu.zip"
    sha256 "0c2996e214ed1a6ca2ed96a6974b21173bbcc70f41909925d9c8eac2a4cdf7cc"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.5.0/recherche-0.5.0-aarch64-apple-darwin.zip"
    sha256 "2b8d77987294a4b172089b7cf921616e3d8ead0e2760c94ac623a37014e89207"
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
