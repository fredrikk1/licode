# licod.io - Linux Command of the Day

> Master Linux one command at a time. Daily lessons with examples and pro tips.

[![Live Site](https://img.shields.io/badge/live-licod.io-blue)](https://licod.io)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 🚀 What is this?

A minimalist website that teaches you one essential Linux command every day. No ads, no tracking, no BS. Just pure command-line knowledge delivered daily with:

- **42 curated commands** - Essential Linux/Unix tools every user should know
- **Daily rotation** - New command each day using seeded shuffle
- **Practical examples** - Real-world usage patterns you can copy
- **Pro tips** - Expert tricks to level up your terminal skills
- **Terminal UI** - Authentic typing animation and command-line feel
- **Works offline** - PWA support, install as an app

## 🎯 Why?

Learning Linux can be overwhelming. This site teaches you **one command at a time**, making it easy to build muscle memory without information overload.

## 💻 Tech Stack

- **100% Vanilla** - No frameworks, zero dependencies, pure HTML/CSS/JS
- **Blazing fast** - <50KB total, loads in <100ms
- **Offline-first** - Service Worker PWA
- **Mobile optimized** - Responsive design, works great on phones

## 🛠️ Development

### Local Setup

```bash
# Clone the repo
git clone https://github.com/yourusername/licod.git
cd licod

# Serve locally
python3 -m http.server 8000
# Open http://localhost:8000
```

### Project Structure

```
licod/
├── index.html           # Main HTML
├── style.css            # Styles + animations
├── script.js            # App logic
├── sw.js               # Service worker (cache version here!)
├── manifest.json       # PWA manifest
├── commands_en.json    # Command data (auto-generated)
├── data/               # Source markdown files (42 commands)
├── create_commands.sh  # Generates data/*.md files
├── collect_en.sh       # Converts .md → commands_en.json
└── bump-cache.sh       # Auto-bumps Service Worker version
```

## 🔧 Adding New Commands

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed workflow.

**Quick version:**

1. Edit `create_commands.sh` and add your command
2. Run `./create_commands.sh && ./collect_en.sh`
3. Bump cache: `./bump-cache.sh`
4. Commit and push

## 📦 Deployment

This site deploys automatically via **GitHub → Netlify**:

1. Push to `main` branch on GitHub
2. Netlify auto-deploys
3. Live on licod.io in ~30 seconds

**Important:** Always run `./bump-cache.sh` before pushing CSS/JS changes so users get the latest version!

## 🤝 Contributing

Contributions welcome! Whether it's:
- Adding new commands
- Improving examples
- Fixing typos
- Better pro tips

Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.

## 📊 Performance

- **Total size**: 42 KB (uncompressed), ~15 KB gzipped
- **Load time**: <100ms on WiFi, <500ms on 4G
- **Lighthouse**: 95-100 scores across all metrics
- **SEO**: Full meta tags, sitemap, robots.txt

## 🎨 Design Philosophy

- **Minimal** - No clutter, focus on the command
- **Fast** - Instant load, smooth animations
- **Accessible** - High contrast, readable fonts
- **Authentic** - Feels like a real terminal

## 📄 License

MIT License - feel free to fork and make your own version!

## ☕ Support

Enjoying licod.io? [Buy me a coffee](https://buymeacoffee.com/fredrikk)

---

**Made with ❤️ for the Linux community**

Visit the live site: [licod.io](https://licod.io)
