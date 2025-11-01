#!/usr/bin/env bash
# build.sh - Production build script for licod.io

set -e

echo "🚀 Building licod.io for production..."

# Create dist directory
mkdir -p dist

# Copy HTML (we'll optimize it manually)
cp index.html dist/

# Minify CSS using Python (no external deps needed)
echo "📦 Minifying CSS..."
python3 << 'PYTHON'
import re

with open('style.css', 'r') as f:
    css = f.read()

# Remove comments
css = re.sub(r'/\*.*?\*/', '', css, flags=re.DOTALL)
# Remove whitespace
css = re.sub(r'\s+', ' ', css)
css = re.sub(r'\s*([{}:;,])\s*', r'\1', css)
css = css.strip()

with open('dist/style.min.css', 'w') as f:
    f.write(css)
    
print(f"CSS minified: {len(open('style.css').read())} → {len(css)} bytes")
PYTHON

# Minify JS using Python
echo "📦 Minifying JavaScript..."
python3 << 'PYTHON'
import re

with open('script.js', 'r') as f:
    js = f.read()

# Remove comments
js = re.sub(r'//.*$', '', js, flags=re.MULTILINE)
js = re.sub(r'/\*.*?\*/', '', js, flags=re.DOTALL)
# Remove excess whitespace (simple minification)
js = re.sub(r'\s+', ' ', js)
js = js.strip()

with open('dist/script.min.js', 'w') as f:
    f.write(js)
    
print(f"JS minified: {len(open('script.js').read())} → {len(js)} bytes")
PYTHON

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

# Update HTML to use minified files
sed -i 's/style\.css/style.min.css/g' dist/index.html
sed -i 's/script\.js/script.min.js/g' dist/index.html

echo "✅ Build complete! Files in dist/"
ls -lh dist/
echo ""
echo "📂 Icons:"
ls -lh dist/icons/ 2>/dev/null || echo "No icons folder"
