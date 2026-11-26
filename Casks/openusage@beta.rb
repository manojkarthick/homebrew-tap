cask "openusage@beta" do
  version "0.7.20-beta.1"
  sha256 "ef318b76f3afa4de14bf869d3fbffafc7f3d20463aa89fbe40247ddb3dde385b"

  url "https://github.com/manojkarthick/openusage/releases/download/v#{version}/OpenUsage-#{version}.dmg"
  name "OpenUsage"
  desc "Menu bar app for tracking AI coding subscription limits (v0.7 fork, beta)"
  homepage "https://github.com/manojkarthick/openusage"

  conflicts_with cask: "openusage"
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "OpenUsage.app"
  binary "#{appdir}/OpenUsage.app/Contents/Helpers/openusage"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/OpenUsage.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.robinebers.openusage",
    "~/Library/Application Support/OpenUsage",
    "~/Library/Logs/OpenUsage",
    "~/Library/Preferences/com.robinebers.openusage.plist",
  ]
end
