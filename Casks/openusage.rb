cask "openusage" do
  version "0.7.18"
  sha256 "811825c93b03d5acfb5f915b9442df63f76c49dbb62da92c393fd521f8cae8cb"

  url "https://github.com/manojkarthick/openusage/releases/download/v#{version}/OpenUsage-#{version}.dmg"
  name "OpenUsage"
  desc "Menu bar app for tracking AI coding subscription limits (v0.7 fork)"
  homepage "https://github.com/manojkarthick/openusage"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "OpenUsage.app"
  binary "#{appdir}/OpenUsage.app/Contents/Helpers/openusage"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/OpenUsage.app"]
  end

  zap trash: [
    "~/Library/Application Support/OpenUsage",
    "~/Library/Application Support/com.robinebers.openusage",
    "~/Library/Logs/OpenUsage",
    "~/Library/Preferences/com.robinebers.openusage.plist",
  ]
end
