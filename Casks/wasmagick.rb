cask "wasmagick" do
  arch arm: "arm64", intel: "x64"

  version "0.0.2"
  sha256 arm:   "a6cde0df356b099327c3ef21062c08ca33c191c4b9c25871b5483d25cfc4a19e",
         intel: "9e5a95a65f15564c96d682e71b97ca69e22c196a18a24be2a2a3b4314a04a979"

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
