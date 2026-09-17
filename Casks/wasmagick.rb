cask "wasmagick" do
  arch arm: "arm64", intel: "x64"

  version "0.0.3"
  sha256 arm:   "5595605a35d3f3c3d66c63f5be9ce2cb77732e0c23188e3db895bbb8ce05ecb9",
         intel: "d4632fcca3954d9e9e555855f5e22521a73ecc87d70797622fa17e95f6237281"

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
