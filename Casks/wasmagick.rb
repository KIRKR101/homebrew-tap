cask "wasmagick" do
  arch arm: "arm64", intel: "x64"

  version "0.0.5"
  sha256 arm:   "ca4f384430614589082fca04444a3d096d647d4c70f1c5f9ef65f9da79765891",
         intel: "6c6a14bfc467518168215f00facc34d875720c4acf5814825c093fc70022c594"

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
