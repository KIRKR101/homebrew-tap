cask "wasmagick" do
  arch arm: "arm64", intel: "x64"

  version "0.0.7"
  sha256 arm:   "c2805737e8fb9439bd6d99e752ed889d4d64f9177ac6a1941f97516a61d66da2",
         intel: "c4eca2d0a159849c1246e8c0a29e8ab0434e70b14dfa54d365d0214066dd57cb"

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
