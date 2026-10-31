cask "kraken" do
  version "1.34.0"
  sha256 :no_check

  url "https://desktop-downloads.kraken.com/latest/kraken-universal-apple-darwin.zip"
  name "Kraken Desktop"
  desc "Trading platform for Kraken markets"
  homepage "https://www.kraken.com/desktop"

  # Kraken publishes the current version separately from its download URL.
  livecheck do
    url "https://desktop-downloads.kraken.com/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # The installer contains a macOS application.
  depends_on :macos

  pkg "Kraken Desktop.pkg"

  uninstall quit:    "com.kraken.desktop",
            pkgutil: "com.kraken.desktop"
end
