# Guiding för att lägga till nya kommando

Detta dokument förklarar hur du använder OpenCode-agenten (mig) för att förberede nya kommando-poster.

---

## 📋 Grundkoncept

Systemet fungerar i tre steg:

1. **create_commands.sh** - Innehåller alla kommando-definitionen (hårdkodad)
2. **create_cmd anrop** - Genererar `.md`-filer i `data/` mappen
3. **collect_en.sh** - Konverterar alla `.md`-filer till `commands_en.json`

---

## 🎯 Instruktion du ger mig (OpenCode-agenten)

Här är formaten du kan använda:

### Format 1: Ett enskilt kommando
```
Hjälp mig att förbereda create_cmd för kommandot '[KOMMANDONAMN]'.

Jag behöver:
1. En kort, tydlig beskrivning (1-2 meningar)
2. Ett användbart "pro tip"
3. 5-6 praktiska exempel i formatet: "kommando → vad det gör"

Ge det i create_cmd format som jag kan copy-paste direkt in i create_commands.sh
```

### Format 2: Flera kommando på en gång
```
Förbered create_cmd anrop för dessa Linux-kommando:
1. tree
2. nslookup
3. netstat

För varje kommando: beskrivning, pro tip, 5 exempel i create_cmd format.
```

### Format 3: Med specifik fokus
```
Förbered create_cmd för 'curl'.
Fokus på: HTTP requests, downloading files, API testing.
Nivå: Nybörjare + lite avancerat.
Ge 6 exempel.
```

---

## ✅ Arbetsgång efter att jag förberett kommandona

Efter att du får `create_cmd` anropet från mig:

### Steg 1: Lägg till i create_commands.sh
```bash
# Öppna filen
nano create_commands.sh

# Rulla ned till precis innan denna rad:
# echo "✅ Created..."

# Lägg in din nya create_cmd anrop här
```

### Steg 2: Skapa .md-filerna
```bash
./create_commands.sh
```
✅ Detta skapar nya `.md`-filer i `data/` mappen

### Steg 3: Generera JSON
```bash
./collect_en.sh
```
✅ Detta uppdaterar `commands_en.json` med alla kommando

### Steg 4: Klart!
Appen läser nu den uppdaterade JSON-filen automatiskt.

---

## 📝 Exempel på create_cmd format

Här är ett komplett exempel på vad jag returnerar:

```bash
create_cmd "grep" \
  "Search for text patterns - finds content in files super fast." \
  "Use 'grep -r' to search entire folders, 'grep -v' to show non-matching lines!" \
  "grep 'error' logfile.txt → Search for 'error'" \
  "grep -r 'TODO' . → Search all files recursively" \
  "grep -i 'warning' *.log → Case-insensitive search" \
  "ps aux | grep nginx → Search process list" \
  "grep -n 'function' script.js → Show line numbers"
```

**Struktur förklarad:**
- `"grep"` - Kommandonamn (måste vara exakt som kommandot heter)
- `"Search for..."` - Beskrivning (1-2 meningar, vad gör det?)
- `"Use 'grep -r'..."` - Pro tip (något användbart/snabbt tips)
- `"grep 'error'..."` - Exempel (använd `→` för att separera kommando från förklaring)

---

## 🎓 Bästa praktiker

### DO ✅
- Be mig om kommando som är verkligt användbara
- Ge kontext: "Fokus på X" eller "Nivå: nybörjare/avancerat"
- Copy-paste exakt vad jag ger dig (det är formaterat rätt)
- Kör BÅDA skripten: `create_commands.sh` OCH `collect_en.sh`

### DON'T ❌
- Redigera `commands_en.json` direkt (det skrivs över nästa gång `collect_en.sh` körs)
- Ta bort gamla `create_cmd` anrop (bara lägg till nya)
- Glömma att köra `collect_en.sh` (utan den finns kommandona bara i `.md`, inte i JSON)

---

## 💡 Snabba exempel

**Du frågar mig:**
```
Förbered create_cmd för 'tree'
```

**Jag svarar:**
```bash
create_cmd "tree" \
  "Display directory structure as a tree - visualize folder hierarchies." \
  "Install with 'apt install tree' if not available. Use '-L 2' to limit depth!" \
  "tree → Show all files and folders as tree" \
  "tree -L 2 → Show only 2 levels deep" \
  "tree -I '*.log' → Exclude .log files" \
  "tree -h → Human-readable file sizes"
```

**Du gör:**
1. Öppna `create_commands.sh`
2. Copy-paste detta innan `echo "✅ Created..."`
3. Kör `./create_commands.sh && ./collect_en.sh`
4. Klart! ✅

---

## 🔍 Verifiering

För att verifiera att allt fungerade:

1. Kolla att `.md`-filen skapades:
   ```bash
   cat data/tree.md
   ```

2. Kolla att det finns i JSON:
   ```bash
   grep -A 5 '"name": "tree"' commands_en.json
   ```

3. Eller bara se det i appen själv!

---

## 📞 Kontakta mig när du är redo

Du kan nu säga något som:
- "Förbered create_cmd för nslookup, netstat och ping"
- "Lägg till tre webby-relaterade kommando: wget, curl, curl-alternativ"
- "Ge mig systemadmin-kommando: systemctl, journalctl, service"

Lycka till! 🚀
