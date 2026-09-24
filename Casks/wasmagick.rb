cask "wasmagick" do
  arch arm: "arm64", intel: "x64"

  version "0.0.6"
  sha256 arm:   "a81b8e344532942f945af10118b1b6bb0d476ddae1b49221e6071af174ce3da6",
         intel: "597a1b3041da33a550f5d54ae22472540ba42cb90ed88cecf3755baa97c34404"

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
