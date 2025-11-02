# licod.io - Reddit Presentation Templates

Use these templates to share licod.io on different subreddits. Customize with your own voice and links.

---

## r/linux & r/commandline

**Title:**
```
I built licod.io – a minimal site to finally learn Linux the right way
```

**Post:**
```
For years I used Linux but never really *learned* it. Whenever something 
broke, I just reinstalled. But the last few years I got sick of that – 
wanted to actually understand what's happening, get real control over my 
system.

So I built licod.io. Nothing fancy – just one essential Linux command 
every day, with practical examples and real-world tips.

🔗 https://licod.io
📖 GitHub: https://github.com/yourusername/licod

The idea is simple: don't overwhelm yourself. Learn one thing well, then 
move on. Repeat daily. Works offline too (PWA), so no excuses when you're 
on the train.

42 curated commands so far (ls, cd, grep, find, sed, etc.). New one every 
morning UTC.

Vanilla JS, no frameworks, no tracking, no ads. Fully open source because 
I believe in this stuff.

Would love any feedback – especially from people who feel like me: "I know 
Linux, but I don't *really* know it yet." This is for us.

Hope this helps someone else get that same sense of control 🐧
```

---

## r/programming & r/sideproject

**Title:**
```
Show: licod.io – learned how to build a PWA by teaching Linux commands
```

**Post:**
```
Built a daily Linux learning site as a side project. Started as: "I need 
to actually learn the command line properly," and became: "What if I made 
something minimal that helps others too?"

🔗 https://licod.io
📖 GitHub: https://github.com/yourusername/licod

**What it does:**
- Shows one essential Linux command daily (seeded rotation, same for everyone)
- Examples, pro tips, and practical use cases
- Works completely offline (PWA with Service Worker)
- Mobile optimized with smooth animations

**Tech stack:**
- 100% vanilla JS (no frameworks – wanted to keep it lean)
- CSS animations (GPU-accelerated)
- Service Worker for offline support
- Static hosting on Netlify

**Why I built it:**
Realized I'd been using Linux for years without understanding the 
fundamentals. Googling commands as I went, never retaining anything. 
Wanted to fix that with a "one thing per day" approach – turns out that's 
pretty effective.

**Lessons learned:**
- Service Worker caching is tricky (had to version the cache manually)
- Staggered animations can actually improve learning (gives time to read)
- Simpler is better – no database, no backend, no complexity

Stats: ~48KB total, <100ms load, 95+ Lighthouse score.

Feedback welcome! Especially curious about: should I add more interactivity? 
Command categories? User-submitted tips?

Full source on GitHub if you want to check it out.
```

---

## r/learnprogramming & r/webdev

**Title:**
```
Built a minimal PWA to teach Linux commands – 100% vanilla JS, no frameworks
```

**Post:**
```
Made a small learning site and learned a lot in the process. Here's what 
I built and what surprised me:

🔗 https://licod.io
📖 GitHub: https://github.com/yourusername/licod

**The project:**
Daily Linux command with examples, pro tips, and smooth animations. One 
command per day, works offline, mobile-first design.

**Why minimal architecture matters:**
Started thinking: how small can I actually make this? Turns out:
- No database needed (seeded shuffle algorithm handles daily rotation)
- No backend needed (static files + Service Worker)
- No framework needed (vanilla JS is plenty for this)
- 48KB total size, loads in <100ms

**Tech decisions I'm happy with:**
- Service Worker for offline PWA support
- GPU-accelerated CSS animations instead of JS
- Seeded random shuffle so everyone gets the same command daily
- Grid layout on mobile for better text handling

**What I struggled with:**
- Service Worker cache versioning (had to manually bump versions)
- Staggered animations in JavaScript (setTimeout chains are messy)
- Mobile layout with cursor positioning

**Open source because:**
Wanted to be transparent about how it works and hopefully help others 
building similar projects.

Would appreciate any feedback or ideas!
```

---

## Hacker News (Show HN)

**Title:**
```
Show HN: licod.io – Learn one Linux command every day
```

**URL:**
```
https://licod.io
```

**First comment (post yourself):**
```
After years of using Linux but constantly googling basic commands, I decided 
to finally learn it properly. Built this as a side project – one essential 
command daily, with examples and pro tips.

The constraint was intentional: one thing per day prevents overwhelm. Turns 
out spacing out learning actually works.

Built with vanilla JS, Service Worker for offline support, and deployed on 
Netlify. Fully open source: https://github.com/yourusername/licod

Curious if this resonates with others who feel the same way – you *use* 
Linux, but you don't really *understand* it yet. Would love feedback.
```

---

## Tips for Success

### Before Posting:
- Replace `yourusername` with your actual GitHub username
- Read the subreddit rules (some prohibit self-promotion)
- Check if similar projects were posted recently

### Best Times to Post:
- **Weekdays (Mon-Thu)** are better than weekends
- **14:00-16:00 CET** reaches US morning (good engagement)
- Avoid posting multiple subreddits within hours (looks like spam)

### After Posting:
- Reply to comments within 30 minutes (shows you care)
- Be honest and genuine (people can tell)
- Link to GitHub generously (devs love code)
- Don't oversell – let the project speak for itself

### Customization:
- Keep your authentic voice
- Add personal touches about your Linux journey
- Mention specific pain points you had
- Be specific about technical challenges you solved

---

## Reddit Subreddit Posting Order

**Day 1 (Best impact):**
1. r/linux (2.1M members)
2. r/commandline (166K members)

**Day 2:**
3. r/programming (7M members – but competitive)
4. r/sideproject (350K members)

**Day 3+:**
5. r/learnprogramming (1M members)
6. r/webdev (615K members)

---

## Alternative Platforms

### Dev.to Blog Post
Write a detailed post about your building process, challenges, and learnings. 
Include screenshots and a link to licod.io.

### Twitter/X
```
Just launched licod.io – a minimal site to learn one Linux command daily 🐧

No frameworks. No tracking. Open source.

For everyone who's *used* Linux for years but never really *learned* it.

https://licod.io

#Linux #webdev #100DaysOfCode
```

### LinkedIn
Share your journey: how you went from avoiding learning Linux to building 
something for others. Professional yet personal.

---

Good luck! 🚀
