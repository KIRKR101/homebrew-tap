cask "wasmagick" do
  arch arm: "arm64", intel: "x64"

  version "0.0.4"
  sha256 arm:   "f1458cdaeea948b0c2aff2fa171f1a63326daec80895a59483b95dd690c19958",
         intel: "81d9e74f14569ba6a56a738b379ff6f20bcc2790e820e5c5a8d44467a927ad68"

  url "https://github.com/KIRKR101/wasmagick/releases/download/v#{version}/WASMagick-#{version}-#{arch}.dmg",
      verified: "github.com/KIRKR101/"
  name "WASMagick"
  desc "Client-side image editor powered by WebAssembly ImageMagick"
  homepage "https://github.com/KIRKR101/wasmagick"

  depends_on macos: :monterey

  app "WASMagick.app"

  caveats <<~EOS
    The app is unsigned, so macOS may report it as "damaged" on first launch.
    Fix it by removing the quarantine flag:

      xattr -dr com.apple.quarantine "/Applications/WASMagick.app"
  EOS

  zap trash: [
    "~/Library/Application Support/WASMagick",
    "~/Library/Preferences/com.wasmagick.app.plist",
  ]
end
