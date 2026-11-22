class Recherche < Formula
  desc "Search your past Claude Code and Codex sessions"
  homepage "https://github.com/manojkarthick/recherche"
  version "0.4.0"
  license "MIT"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.4.0/recherche-0.4.0-aarch64-unknown-linux-gnu.zip"
    sha256 "b7042823a65032e690194e03dd31c29d2cfbc5cd2743867002a3bc4f17b6e537"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.4.0/recherche-0.4.0-x86_64-unknown-linux-gnu.zip"
    sha256 "bfe43624211f78d1476bb1ccb4c1c0d5a263a4447e4c14fb751e4c82e197d7a4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/manojkarthick/recherche/releases/download/v0.4.0/recherche-0.4.0-aarch64-apple-darwin.zip"
    sha256 "e48ab67cf36284424571a8c99a770e4c9b906c0be8854dee587afaf0e12be840"
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
