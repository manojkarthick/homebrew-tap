cask "pentimento" do
  version "0.1.0"
  sha256 "f4e6873470f66e7505ebb7bb02dc70a9dfe3c07281a90b0483b07e1ba0ca9f63"

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
