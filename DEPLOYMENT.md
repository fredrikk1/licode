# Deployment Guide for licod.io

## Quick Start

1. **Build for production:**
   ```bash
   ./build.sh
   ```

2. **Deploy the `dist/` folder** to your hosting provider

## What Gets Built

The build script creates optimized files in `dist/`:
- `index.html` - Updated to use minified assets
- `style.min.css` - Minified CSS (~4 KB)
- `script.min.js` - Minified JavaScript (~6 KB)
- `commands_en.json` - Command data
- `manifest.json` - PWA manifest

## Additional Files to Deploy

Make sure to also deploy these files from the root:
- `sw.js` - Service worker (offline support)
- `robots.txt` - SEO
- `sitemap.xml` - SEO
- `favicon.svg` - Favicon

## Hosting Options

### Option 1: Netlify (Recommended)
1. Connect your Git repository
2. Build command: `./build.sh`
3. Publish directory: `dist`
4. Deploy!

### Option 2: Vercel
1. Connect your Git repository
2. Build command: `./build.sh`
3. Output directory: `dist`
4. Deploy!

### Option 3: GitHub Pages
1. Build locally: `./build.sh`
2. Push `dist/` contents to `gh-pages` branch
3. Enable GitHub Pages in settings

### Option 4: Traditional hosting (cPanel, etc.)
1. Build locally: `./build.sh`
2. Upload `dist/` contents via FTP/SFTP
3. Also upload: `sw.js`, `robots.txt`, `sitemap.xml`, `favicon.svg`

## Performance Optimizations

### Already Implemented ✅
- Minified CSS and JavaScript
- Preload hints for critical resources
- Service Worker for offline caching
- Optimized meta tags for SEO
- PWA support

### Server Configuration (Optional)

**Enable gzip compression** in your server config:

**Nginx:**
```nginx
gzip on;
gzip_types text/css application/javascript application/json;
```

**Apache (.htaccess):**
```apache
<IfModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/css application/javascript application/json
</IfModule>
```

**Set cache headers:**
```nginx
location ~* \.(css|js|json)$ {
  expires 1y;
  add_header Cache-Control "public, immutable";
}
```

## Testing Before Deployment

1. Test locally:
   ```bash
   cd dist
   python3 -m http.server 8000
   ```

2. Open `http://localhost:8000`

3. Run Lighthouse audit in Chrome DevTools

## Expected Performance

- **Load time**: <500ms on 4G
- **Total size**: ~42 KB (uncompressed), ~15 KB (gzipped)
- **Lighthouse scores**: 95-100 across all metrics
- **Works offline**: Yes (after first visit)

## Post-Deployment Checklist

- [ ] Test on desktop
- [ ] Test on mobile
- [ ] Run Lighthouse audit
- [ ] Test PWA install
- [ ] Test offline mode
- [ ] Check robots.txt is accessible
- [ ] Submit sitemap to Google Search Console
- [ ] Test share functionality

## Analytics (Optional)

For privacy-friendly analytics, consider:
- **Plausible.io** - No cookies, GDPR compliant
- **Fathom Analytics** - Privacy-first
- **Simple Analytics** - Minimal, privacy-focused

Add tracking script to `index.html` before `</body>`:
```html
<script defer data-domain="licod.io" src="https://plausible.io/js/script.js"></script>
```

## Updating Content

To add/update commands:
1. Edit files in `data/` or modify `create_commands.sh`
2. Run `./create_commands.sh && ./collect_en.sh`
3. Rebuild: `./build.sh`
4. Deploy `dist/`

## Support

Issues? Check:
- Console errors in browser DevTools
- Service Worker registration status
- Network tab for failed requests
