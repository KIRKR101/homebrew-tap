cask "wasmagick" do
  arch arm: "arm64", intel: "x64"

  version "0.0.1"
  sha256 arm:   "ba9f3ebaaf7fed88ccda511d094c23932524b1331373500144ce20f7dc0c2c8e",
         intel: "a076dda2a196741dade0b54d19d4157a13ab4abd5fe75d5f84b59655723fcc92"

  url "https://github.com/KIRKR101/wasmagick/releases/download/v#{version}/WASMagick-#{version}-#{arch}.dmg",
      verified: "github.com/KIRKR101/"
  name "WASMagick"
  desc "Client-side image editor powered by WebAssembly ImageMagick"
  homepage "https://github.com/KIRKR101/wasmagick"

  depends_on macos: :monterey

  app "WASMagick.app"

  zap trash: [
    "~/Library/Application Support/WASMagick",
    "~/Library/Preferences/com.wasmagick.app.plist",
  ]
end
