# Nybörjarguide - licod.io

## 🔍 SEO (Search Engine Optimization)

### Vad är det?
SEO är att optimera din sida så att Google, Bing etc. hittar och rankar den bra.

### Vad har jag gjort?
✅ **Meta tags** - Beskriver din sida för sökmotorer
✅ **robots.txt** - Säger "ja, indexera min sida!"
✅ **sitemap.xml** - Karta över din sida för Google

### Vad behöver DU göra?
1. **Google Search Console** (viktigt!)
   - Gå till: https://search.google.com/search-console
   - Lägg till din domän: licod.io
   - Verifiera ägarskap (följ instruktionerna)
   - Skicka in din sitemap: `https://licod.io/sitemap.xml`
   
2. **Vänta 1-4 veckor** - Google indexerar din sida
   
3. **Testa om du syns**:
   ```
   Sök på Google: site:licod.io
   ```
   Om din sida dyker upp = SUCCESS! 🎉

### Kommer folk hitta min sida?
Ja, men det tar tid:
- **1-2 veckor**: Google hittar sidan
- **1-3 månader**: Börjar ranka för sökord
- **Sökord som funkar**: "linux commands daily", "learn linux terminal", etc.

**Tips**: Dela på Reddit (/r/linux, /r/commandline), Twitter, forum → snabbare trafik!

---

## 📱 PWA (Progressive Web App)

### Vad är det?
Din webbsida kan **installeras som en app** på mobil/desktop - utan App Store!

### För ANVÄNDARE:

#### På mobil (Android/iOS):
1. Besök licod.io i Chrome/Safari
2. Se popup: "Add to Home Screen" (lägg till på hemskärm)
3. Klicka "Add"
4. Nu finns licod.io som en app-ikon!
5. Öppna den → fungerar som riktig app
6. **Fungerar offline** efter första besöket

#### På desktop (Chrome/Edge):
1. Besök licod.io
2. Se ikon i adressfältet (+ eller installera)
3. Klicka "Install"
4. Nu finns licod.io i applikationslistan
5. Öppna som egen app-fönster

### För DIG (admin):
Ingenting! Det fungerar automatiskt när sidan är live.

### Fördelar:
- ✅ Användare kan använda offline
- ✅ Ser mer professionell ut
- ✅ Snabbare än webbläsare
- ✅ Push notifications (framtida feature)

---

## 🛠️ Build & Deploy

### Vad är "Build"?

**Enkelt sagt**: Packa och optimera din sida för produktion.

**Utan build**:
```
style.css     → 6.5 KB (med kommentarer, spaces)
script.js     → 9.6 KB (med kommentarer, spaces)
```

**Med build** (`./build.sh`):
```
style.min.css → 5.0 KB (minifierad, komprimerad)
script.min.js → 7.5 KB (minifierad, komprimerad)
```

### Vad gör build-scriptet?

```bash
./build.sh
```

Detta händer:
1. **Skapar `dist/` mapp** - där optimerade filer hamnar
2. **Minifierar CSS** - tar bort spaces, kommentarer
3. **Minifierar JavaScript** - komprimerar koden
4. **Kopierar JSON och manifest** - data-filer
5. **Uppdaterar HTML** - länkar till .min.css/.min.js

**Resultat**: `dist/` innehåller produktionsklara filer!

### När ska jag bygga?

Kör `./build.sh` varje gång INNAN du deployer:
- Ändrat CSS/JS? → Bygg om
- Uppdaterat kommandon? → Bygg om
- Ska deploya till live? → Bygg först!

---

## 📚 Dokumentation

### Vilka filer är dokumentation?
- `README.md` - Översikt och instruktioner
- `DEPLOYMENT.md` - Deploy-guide
- `CHECKLIST.md` - Pre-launch checklista
- `AGENTS.md` - För AI-utveckling
- `BEGINNERS_GUIDE.md` - Denna fil!

### Kan andra se dem?
**Om privat GitHub repo**: Nej, bara du.
**Om publikt repo**: Ja, alla kan läsa dem.
**På live-sidan (licod.io)**: Nej, de deployeras inte.

Dokumentationen är för **utveckling**, inte för besökare.

---

## ☁️ Netlify

### Vad är det?
**Gratis hosting för statiska sidor** (HTML/CSS/JS). Perfekt för licod.io!

### Varför är det bra?
- ✅ **Gratis** (för små projekt)
- ✅ **Automatisk deploy** från Git
- ✅ **HTTPS gratis** (SSL-certifikat)
- ✅ **Custom domain** (licod.io)
- ✅ **CDN globalt** (snabbt överallt)
- ✅ **Automatiska builds**

### Hur funkar det?

**Metod 1: Dra & släpp** (snabbast):
1. Gå till https://netlify.com
2. Skapa konto (gratis)
3. Kör `./build.sh` lokalt
4. Dra `dist/` mappen till Netlify
5. Klart! Du får en URL typ `random-name-123.netlify.app`
6. Koppla din domän (licod.io) i inställningar

**Metod 2: Git integration** (bäst långsiktigt):
1. Gör repot publikt på GitHub (eller privat med Netlify access)
2. Koppla Netlify till GitHub
3. Välj repo
4. Build command: `./build.sh`
5. Publish directory: `dist`
6. Varje push → automatisk deploy! 🚀

### Kostnad?
Gratis för:
- 100 GB bandbredd/månad
- 300 build-minuter/månad

Mer än tillräckligt för licod.io!

---

## ⚡ Vercel

### Vad är det?
Samma som Netlify - gratis hosting för statiska sidor.

### Vercel vs Netlify?

| Feature | Netlify | Vercel |
|---------|---------|--------|
| Gratis tier | ✅ Bra | ✅ Bra |
| Deploy speed | 🚀 Snabb | 🚀 Lite snabbare |
| Interface | 👍 Enklare | 🤓 Mer tech |
| Edge network | ✅ Global | ✅ Global |

**Mitt tips**: Börja med **Netlify** (enklare interface).

Båda är utmärkta val!

---

## 🐙 GitHub Pages

### Vad är det?
**Gratis hosting direkt från GitHub-repo**. Varje repo kan ha en live-sida.

### Hur funkar det?
1. Bygg lokalt: `./build.sh`
2. Pusha `dist/` till en `gh-pages` branch
3. Aktivera Pages i repo-inställningar
4. Din sida blir live på: `username.github.io/licod`

### Privat repo - spelar det roll?
**JA!** GitHub Pages kräver **publikt repo** för gratis-tier.

**Lösningar**:
- Gör repot publikt (rekommenderat - open source!)
- Betala för GitHub Pro ($4/mån) → privata Pages
- Använd Netlify/Vercel istället (funkar med privata repos)

**Min rekommendation**: Gör repot publikt. Din kod är bra och kan hjälpa andra!

---

## 🔦 Lighthouse

### Vad är det?
**Googles verktyg för att testa webbsidor**. Gratis, inbyggt i Chrome.

### Vad testar det?
- **Performance** (hastighet)
- **Accessibility** (tillgänglighet)
- **Best Practices** (bästa praxis)
- **SEO** (sökmotoroptimering)
- **PWA** (app-funktionalitet)

### Hur kör jag det?

**I Chrome:**
1. Högerklicka på licod.io
2. Välj "Inspect" (Granska)
3. Klicka på "Lighthouse" tab
4. Välj kategorierna du vill testa
5. Klicka "Analyze page load"
6. Vänta ~30 sekunder
7. Se dina scores! (0-100 per kategori)

### Vad är bra scores?
- **90-100**: Excellent! 🎉
- **50-89**: Okej, kan förbättras
- **0-49**: Behöver åtgärdas

**licod.io förväntas få**: 95-100 i alla kategorier! 🚀

### Tips:
Kör alltid på:
- **Desktop OCH mobile**
- **Incognito-läge** (inga extensions)
- **Deployed site** (inte localhost)

---

## 🌐 ONE.com + Custom Domain

Du har **licod.io** registrerad på ONE.com. Perfekt!

### Vad behöver du göra?

#### Steg 1: Deploy till Netlify först
(enklast)

#### Steg 2: Koppla domänen

**I Netlify:**
1. Gå till Site settings → Domain management
2. Klicka "Add custom domain"
3. Skriv: `licod.io`
4. Netlify ger dig DNS-inställningar

**I ONE.com:**
1. Logga in på ONE.com
2. Gå till DNS-inställningar för licod.io
3. Lägg till records från Netlify:
   ```
   A Record:    @ → 75.2.60.5 (Netlify IP)
   CNAME:       www → your-site.netlify.app
   ```
4. Vänta 1-24 timmar (DNS propagation)

**Klart!** licod.io pekar nu på din Netlify-sida.

#### Alternativ: ONE.com egen hosting
Om du vill använda ONE.com direkte:
1. Kör `./build.sh`
2. Logga in på ONE.com control panel
3. Hitta File Manager
4. Ladda upp alla filer från `dist/`
5. Ladda även upp: `sw.js`, `robots.txt`, `sitemap.xml`, `favicon.svg`

**Problem med ONE.com**: Mindre flexibelt än Netlify.

---

## 🚀 Rekommenderad workflow

### För dig (nybörjare):

**1. Deploy första versionen (idag!):**
```bash
cd /home/fredrik/Dokument/licod
./build.sh
```

**2. Välj hosting:**
→ **Netlify** (mitt tips, enklast)

**3. Dra & släpp deploy:**
- Skapa Netlify-konto
- Dra `dist/` mappen
- Få en live URL

**4. Koppla domän:**
- Följ Netlify-guide
- Uppdatera DNS på ONE.com

**5. Verifiera:**
- Testa licod.io
- Kör Lighthouse
- Lägg till Google Search Console

**Klart!** 🎉

### Framtida ändringar:

```bash
# 1. Gör ändringar i koden
vim style.css

# 2. Testa lokalt
python3 -m http.server 8000

# 3. Bygg
./build.sh

# 4. Deploy
# Dra dist/ till Netlify (om manuell)
# Eller: git push (om automatisk)
```

---

## ❓ Vanliga frågor

**Q: Måste jag lära mig Git?**
A: Inte nu! Börja med dra & släpp. Lär dig Git senare.

**Q: Kostar något?**
A: Nej! Netlify gratis + licod.io domän (redan betald).

**Q: Hur lång tid tar deploy?**
A: 30 sekunder - 2 minuter.

**Q: Kan jag ändra saker efter deploy?**
A: Ja! Bygg om och deploya igen.

**Q: Vad händer om sidan kraschar?**
A: Statiska sidor kraschar inte. Bara hosting kan gå ner (sällsynt).

**Q: Behöver jag databas?**
A: Nej, licod.io använder JSON-filer.

---

## 🎯 Nästa steg - Action Plan

**Idag (30 min):**
1. ✅ Kör `./build.sh`
2. ✅ Skapa Netlify-konto
3. ✅ Dra & släpp deploy
4. ✅ Få en live URL

**Denna vecka:**
1. ✅ Koppla licod.io domän
2. ✅ Testa på mobil
3. ✅ Kör Lighthouse
4. ✅ Fixa app-ikoner (192x192, 512x512)

**Nästa vecka:**
1. ✅ Google Search Console
2. ✅ Dela på sociala medier
3. ✅ Överväg analytics (Plausible)

---

**Frågor?** Just ask! 🚀
