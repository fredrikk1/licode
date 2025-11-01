#!/usr/bin/env bash
# install-favicons.sh - Install favicons from realfavicongenerator.net

echo "📦 Installing favicons..."

# Skapa icons-mapp
mkdir -p icons

# Flytta PNG-filer till icons/
mv android-chrome-192x192.png icons/icon-192.png 2>/dev/null
mv android-chrome-512x512.png icons/icon-512.png 2>/dev/null
mv apple-touch-icon.png icons/ 2>/dev/null
mv favicon-16x16.png . 2>/dev/null
mv favicon-32x32.png . 2>/dev/null
mv favicon.ico . 2>/dev/null

# Kopiera webmanifest info till manifest.json (manuellt)
echo "⚠️  Uppdatera manifest.json med icon-paths manuellt"

echo "✅ Klart! Filer installerade."
echo ""
echo "Nästa steg:"
echo "1. Uppdatera manifest.json (icon paths)"
echo "2. Bygg: ./build.sh"
echo "3. Deploy!"
