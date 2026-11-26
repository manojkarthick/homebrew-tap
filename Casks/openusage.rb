cask "openusage" do
  version "0.7.19"
  sha256 "a9a3de4056d5e81b8aa6eab6217e283c88323ab986af3be5e69b63d20723da67"

  url "https://github.com/manojkarthick/openusage/releases/download/v#{version}/OpenUsage-#{version}.dmg"
  name "OpenUsage"
  desc "Menu bar app for tracking AI coding subscription limits (v0.7 fork)"
  homepage "https://github.com/manojkarthick/openusage"

  auto_updates true
  conflicts_with cask: "openusage@beta"
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
