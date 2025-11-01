#!/usr/bin/env bash
# build.sh - Production build script for licod.io

set -e

echo "🚀 Building licod.io for production..."

# Create dist directory
mkdir -p dist

# Copy HTML
cp index.html dist/

# Copy CSS and JS directly (files are small ~10KB, gzip will compress)
echo "📦 Copying CSS and JS..."
cp style.css dist/
cp script.js dist/

# Copy JSON and manifest
cp commands_en.json dist/
cp manifest.json dist/

# Copy icons and other assets
echo "📦 Copying icons and assets..."
cp -r icons dist/ 2>/dev/null || echo "⚠️  No icons/ folder found (run favicon setup first)"
cp sw.js dist/ 2>/dev/null || echo "⚠️  No sw.js found"
cp robots.txt dist/ 2>/dev/null || echo "⚠️  No robots.txt found"
cp sitemap.xml dist/ 2>/dev/null || echo "⚠️  No sitemap.xml found"
cp favicon*.png dist/ 2>/dev/null || echo "⚠️  No favicon PNGs found"
cp favicon.ico dist/ 2>/dev/null || echo "⚠️  No favicon.ico found"
cp favicon.svg dist/ 2>/dev/null || true

echo "✅ Build complete! Files in dist/"
ls -lh dist/
echo ""
echo "📂 Icons:"
ls -lh dist/icons/ 2>/dev/null || echo "No icons folder"
