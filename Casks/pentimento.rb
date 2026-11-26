cask "pentimento" do
  # Placeholder until the first release; manojkarthick/pentimento's Release workflow bumps both lines.
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/manojkarthick/pentimento/releases/download/v#{version}/Pentimento-#{version}.dmg"
  name "Pentimento"
  desc "Inspect and remove photo metadata"
  homepage "https://github.com/manojkarthick/pentimento"

  depends_on macos: :sonoma

  app "Pentimento.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pentimento.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.manoj.pentimento.plist",
    "~/Library/Saved Application State/com.manoj.pentimento.savedState",
  ]
end
