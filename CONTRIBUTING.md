# Contributing to licod.io

Thanks for wanting to contribute! 🎉 This guide will help you add commands safely and effectively.

## 🤝 How to Contribute

### What you can contribute:

- ✅ New Linux commands
- ✅ Better examples for existing commands
- ✅ Improved pro tips
- ✅ Bug fixes
- ✅ Typo corrections

### What NOT to submit:

- ❌ Commands that delete/destroy data without warning
- ❌ Overly complex examples
- ❌ Non-Linux/Unix commands
- ❌ Marketing or promotional content

## 🚀 Quick Workflow

### 1. Fork & Clone

```bash
# Fork the repo on GitHub, then:
git clone https://github.com/YOUR-USERNAME/licod.git
cd licod
```

### 2. Add Your Command

Edit `create_commands.sh` and add your command using the `create_cmd` function:

```bash
create_cmd "commandname" \
  "Brief description - what the command does." \
  "Pro tip - expert advice or time-saving trick!" \
  "example1 → What it does" \
  "example2 → What it does" \
  "example3 → What it does"
```

**Example:**

```bash
create_cmd "systemctl" \
  "Control systemd services - start, stop, and manage system services." \
  "Use 'systemctl --failed' to quickly see what's broken!" \
  "systemctl status nginx → Check service status" \
  "sudo systemctl start nginx → Start service" \
  "sudo systemctl enable nginx → Auto-start on boot" \
  "systemctl list-units → Show all running services"
```

### 3. Generate Data

```bash
# Creates data/commandname.md
./create_commands.sh

# Converts all .md files to commands_en.json
./collect_en.sh
```

### 4. Test Locally

```bash
# Start local server
python3 -m http.server 8000

# Open http://localhost:8000
# Verify your command appears correctly
```

### 5. Commit & Push

```bash
git add .
git commit -m "Add systemctl command"
git push origin main
```

### 6. Create Pull Request

1. Go to the original repo on GitHub
2. Click "New Pull Request"
3. Select your fork
4. Write a clear description
5. Submit!

## ✅ Pull Request Guidelines

### Good PR title:
- ✅ "Add systemctl command"
- ✅ "Improve grep examples"
- ✅ "Fix typo in ssh description"

### Bad PR title:
- ❌ "Update"
- ❌ "Changes"
- ❌ "Fixed stuff"

### PR Description should include:
- What you changed
- Why you changed it
- If adding a command: why it's essential

**Example:**
```
## What
Added systemctl command

## Why
systemctl is essential for managing services on modern Linux systems. 
Most beginners struggle with starting/stopping services, so this will help.

## Testing
Tested locally, all examples work on Ubuntu 22.04 and Fedora 38.
```

## 🛡️ Security & Safety

### For Contributors:

- Only edit `create_commands.sh` and `data/*.md` files
- Don't modify `script.js`, `index.html`, or `sw.js` without discussing first
- Test all examples before submitting
- Ensure commands are safe and won't harm systems

### For Maintainers (reviewing PRs):

1. **Check the diff** - only `create_commands.sh` and `data/*.md` should change
2. **Test examples** - make sure they actually work
3. **Verify safety** - no destructive commands without clear warnings
4. **Run scripts locally**:
   ```bash
   ./create_commands.sh
   ./collect_en.sh
   # Check commands_en.json looks correct
   ```
5. **Bump cache** before merging to main:
   ```bash
   ./bump-cache.sh
   ```
6. Merge and deploy!

## 📝 Command Guidelines

### Good Command Characteristics:

- **Essential** - Used frequently by Linux users
- **Beginner-friendly** - Useful for learning
- **Well-documented** - Clear examples
- **Safe** - Won't break systems

### Example Quality Checklist:

- ✅ Includes description arrow (→) showing what it does
- ✅ Uses realistic paths/filenames
- ✅ Shows both simple and advanced usage
- ✅ Pro tip is actionable and useful
- ✅ Examples are copy-pasteable

### Bad Examples:

```bash
# Too vague
"ls → lists files"

# Too complex
"find . -type f -exec sh -c 'for i; do ...' sh {} +"

# Unsafe without warning
"rm -rf / → Delete everything"
```

### Good Examples:

```bash
# Clear and actionable
"ls -la → Show ALL files including hidden ones (start with .)"

# Practical and safe
"rm -i important.txt → Ask before deleting"

# Helpful context
"grep -r 'TODO' . → Search all files recursively for TODO"
```

## 🎯 Pro Tip Guidelines

A great pro tip should:
- Save time
- Teach a shortcut
- Reveal hidden functionality
- Be immediately actionable

**Good:**
- "Use 'ls -ltr' to see newest files at bottom - perfect for long directories!"
- "Press Ctrl+R for interactive history search!"

**Bad:**
- "This command is very useful"
- "You should use this often"

## 🐛 Reporting Bugs

Found a bug? Open an issue with:
1. What you expected
2. What actually happened
3. Browser/OS version
4. Steps to reproduce

## 💡 Suggesting Features

Have an idea? Open an issue with:
1. What feature you want
2. Why it would be useful
3. How it might work

## ❓ Questions

Not sure about something? Just ask! Open an issue or discussion.

## 🙏 Thank You

Every contribution makes licod.io better for the Linux community. Thank you! ❤️

---

**Ready to contribute?** Start with a small improvement like fixing a typo or improving an example!
