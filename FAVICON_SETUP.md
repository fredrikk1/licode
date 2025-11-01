# Favicon Setup Guide - licod.io

## 🎨 Steg 1: Exportera från Canva

1. Öppna din design i Canva
2. Klicka "Share" → "Download"
3. Välj:
   - **Format**: PNG
   - **Size**: Custom → 1024 x 1024 px
   - **Background**: Transparent (eller vit om pingvinen har transparent delar)
4. Ladda ner filen
5. Spara som: `licod-favicon.png`

## 🔧 Steg 2: Generera favicons

1. Gå till: https://realfavicongenerator.net/
2. Klicka "Select your Favicon image"
3. Ladda upp `licod-favicon.png`

### Inställningar:

#### iOS Web Clip
```
Background: White/Gray or dark background
Margin: 0%
Scaling: Lanczos
```

#### Android Chrome
```
Theme color: #000000
Manifest name: licod.io - Linux Command of the Day
Short name: licod.io
Display: standalone
```

#### Windows Metro
```
Background: Använd standardinställning
```

#### Favicon Generator Options (längst ner)
```
Path: /
App name: licod.io
Compression: High quality
```

4. Klicka "Generate your Favicons and HTML code"
5. Ladda ner `favicon_package.zip`

## 📦 Steg 3: Installera

1. Packa upp `favicon_package.zip` i ditt projekt:
   ```bash
   cd /home/fredrik/Dokument/licod
   unzip ~/Downloads/favicon_package.zip
   ```

2. Kör installations-scriptet:
   ```bash
   ./install-favicons.sh
   ```

3. Struktur efter installation:
   ```
   licod/
   ├── icons/
   │   ├── icon-192.png        (från android-chrome-192x192.png)
   │   ├── icon-512.png        (från android-chrome-512x512.png)
   │   └── apple-touch-icon.png
   ├── favicon-16x16.png
   ├── favicon-32x32.png
   ├── favicon.ico
   └── browserconfig.xml
   ```

## 🔄 Steg 4: Uppdatera manifest.json

Öppna `manifest.json` och verifiera:

```json
{
  "icons": [
    {
      "src": "/icons/icon-192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/icons/icon-512.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "any maskable"
    }
  ]
}
```

## 📝 Steg 5: Uppdatera index.html

realfavicongenerator.net ger dig HTML-kod. Kopiera denna del till `<head>`:

```html
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="apple-touch-icon" sizes="180x180" href="/icons/apple-touch-icon.png">
<link rel="manifest" href="/manifest.json">
<meta name="theme-color" content="#000000">
```

**OBS**: Du har redan `manifest.json` och `theme-color`, så ersätt bara favicon-länkarna.

## ✅ Steg 6: Verifiera lokalt

1. Starta lokal server:
   ```bash
   python3 -m http.server 8000
   ```

2. Öppna: http://localhost:8000

3. Kontrollera i DevTools:
   - F12 → Application → Manifest
   - Se att alla ikoner laddas korrekt
   - Inga 404-errors

4. Testa favicon:
   - Se i browser tab (liten ikon)
   - Kolla i Bookmarks (om du bokmärker sidan)

## 🚀 Steg 7: Bygg och deploya

```bash
# Bygg
./build.sh

# Verifiera att icons/ kopieras till dist/
ls -la dist/icons/

# Om icons/ INTE finns i dist/, lägg till i build.sh:
# Lägg till denna rad i build.sh efter "mkdir -p dist":
# cp -r icons dist/ 2>/dev/null || true

# Deploy till Netlify
# Dra dist/ + icons/ till Netlify
```

## 🎯 Checklist

- [ ] Exporterat från Canva (1024x1024 PNG)
- [ ] Genererat via realfavicongenerator.net
- [ ] Packat upp favicon_package.zip
- [ ] Kört install-favicons.sh
- [ ] Uppdaterat manifest.json
- [ ] Uppdaterat index.html med favicon-länkar
- [ ] Testat lokalt
- [ ] Favicons syns korrekt i tab
- [ ] PWA-ikoner fungerar (DevTools → Application)
- [ ] Byggt med ./build.sh
- [ ] Icons/ finns i dist/
- [ ] Deployat till Netlify

## 🐛 Felsökning

**Problem: Favicon syns inte**
```
Lösning:
1. Hårt refresh: Ctrl+Shift+R
2. Töm cache: DevTools → Application → Clear storage
3. Kolla console för 404-errors
```

**Problem: Icons saknas i dist/**
```
Lösning:
Lägg till i build.sh:
cp -r icons dist/ 2>/dev/null || true
```

**Problem: PWA-ikon ser pixlig ut**
```
Lösning:
Exportera större från Canva (2048x2048)
Kör igen genom realfavicongenerator.net
```

## 📸 Testresultat

Efter installation bör du se:
- ✅ Tux-pingvinen i browser tab
- ✅ Tux med "licod.io" text på mobil hemskärm
- ✅ Korrekt tema-färg (#000) på Android
- ✅ Ingen 404 i console

---

**Din favicon är nu professionell och redo! 🎉**
