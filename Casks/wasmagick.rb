cask "wasmagick" do
  arch arm: "arm64", intel: "x64"

  version "0.0.3"
  sha256 arm:   "828712aee7f2c1e2cd415c35b775979413fceef629afb70667a8610691a9003c",
         intel: "5b3ba85a103056968f1a74886d9205e96cf280a0c22f529c6cd5d9f76a1313fb"

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
