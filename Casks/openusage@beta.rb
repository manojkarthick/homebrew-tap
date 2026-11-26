cask "openusage@beta" do
  version "0.7.20-beta.2"
  sha256 "8c063ff66a05c4a16c8b41964101812f6a85625a2acb5585633cef7595c31dd6"

  url "https://github.com/manojkarthick/openusage/releases/download/v#{version}/OpenUsage-#{version}.dmg"
  name "OpenUsage"
  desc "Menu bar app for tracking AI coding subscription limits (v0.7 fork, beta)"
  homepage "https://github.com/manojkarthick/openusage"

  auto_updates true
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
