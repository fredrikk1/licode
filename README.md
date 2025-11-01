# licod.io - Linux Command of the Day

> Learn one Linux command every day. Simple, minimal, effective.

## 🚀 Features

- **Daily rotation** - New command every day (seeded shuffle)
- **42 curated commands** - Essential Linux/Unix tools
- **Examples & pro tips** - Practical usage patterns
- **Terminal-style UI** - Authentic typing animation
- **PWA support** - Install as app, works offline
- **Blazing fast** - <50ms load time, 42KB total
- **Fully responsive** - Desktop and mobile optimized

## 📦 Quick Start

### Development
```bash
# Serve locally
python3 -m http.server 8000

# Generate command data
./create_commands.sh && ./collect_en.sh
```

### Production Build
```bash
# Build optimized version
./build.sh

# Output in dist/ folder
```

## 🛠️ Tech Stack

- **Vanilla JavaScript** - No frameworks, zero dependencies
- **CSS Animations** - GPU-accelerated, smooth performance
- **Service Worker** - Offline-first PWA
- **Static files** - Deploy anywhere

## 📊 Performance

- **Total size**: 42 KB uncompressed, ~15 KB gzipped
- **Load time**: <500ms on 4G, <50ms on WiFi
- **Lighthouse**: 95-100 scores across all metrics
- **Offline support**: Yes (after first visit)

## 📁 Project Structure

```
licod/
├── index.html          # Main HTML
├── style.css           # Styles + animations
├── script.js           # App logic + animations
├── sw.js              # Service worker
├── manifest.json      # PWA manifest
├── commands_en.json   # Command data (generated)
├── data/              # Command markdown files
├── create_commands.sh # Generate command .md files
├── collect_en.sh      # Parse .md → JSON
├── build.sh           # Production build script
└── dist/              # Build output (gitignored)
```

## 🎨 Design Philosophy

- **Minimal** - No clutter, just the command
- **Fast** - Load instantly, animate smoothly
- **Accessible** - Clear typography, good contrast
- **Terminal-authentic** - Feels like real shell

## 🔧 Adding Commands

1. Edit `create_commands.sh` and add your command:
   ```bash
   create_cmd "commandname" \
     "Description" \
     "Pro tip" \
     "example 1" \
     "example 2"
   ```

2. Regenerate data:
   ```bash
   ./create_commands.sh && ./collect_en.sh
   ```

3. Rebuild:
   ```bash
   ./build.sh
   ```

## 🚀 Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed instructions.

**TL;DR:**
1. Run `./build.sh`
2. Deploy `dist/` + root files to hosting
3. Works on: Netlify, Vercel, GitHub Pages, any static host

## 📈 SEO & PWA

- ✅ Optimized meta tags (Open Graph, Twitter Cards)
- ✅ robots.txt and sitemap.xml
- ✅ Preload hints for critical resources
- ✅ Service worker for offline support
- ✅ PWA installable on mobile and desktop
- ✅ Favicon and app icons

## 🤝 Contributing

Ideas for improvement? Found a bug? Open an issue!

## 📄 License

MIT License - do whatever you want with it!

## ☕ Support

Enjoying licod.io? [Buy me a coffee](https://buymeacoffee.com/fredrikk)

---

Made with ❤️ for the Linux community
