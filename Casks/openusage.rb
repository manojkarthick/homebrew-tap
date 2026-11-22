cask "openusage" do
  version "0.7.17"
  sha256 "17cdd34c9d409be13b61d1fc6cef124b99b6e183ed1b3df7ccf815f2b2000acb"

  url "https://github.com/manojkarthick/openusage/releases/download/v#{version}/OpenUsage-#{version}.dmg"
  name "OpenUsage"
  desc "Menu bar app for tracking AI coding subscription limits (v0.7 fork)"
  homepage "https://github.com/manojkarthick/openusage"

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "OpenUsage.app"
  binary "#{appdir}/OpenUsage.app/Contents/Helpers/openusage"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OpenUsage.app"]
  end

  zap trash: [
    "~/Library/Application Support/OpenUsage",
    "~/Library/Application Support/com.robinebers.openusage",
    "~/Library/Logs/OpenUsage",
    "~/Library/Preferences/com.robinebers.openusage.plist",
  ]
end
