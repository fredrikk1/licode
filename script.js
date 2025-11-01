// Register service worker for offline support
if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('/sw.js')
      .then(reg => console.log('Service Worker registered'))
      .catch(err => console.log('Service Worker registration failed:', err))
  })
}

const commands = [];
let shuffled = [];
let todayIndex = 0;
let currentIndex = 0;
let isExpanded = false;
let isSharedVisitor = false;
let coffeeHasBeenShown = false;
const startDate = new Date('2025-01-01');
fetch('commands_en.json')
  .then(r => {
    if (!r.ok) throw new Error('Failed to load commands')
    return r.json()
  })
  .then(data => {
    commands.push(...data);
    initApp();
  })
  .catch(err => {
    console.error('Error loading commands:', err)
    document.getElementById('command-name').textContent = 'Failed to load commands'
    document.getElementById('command-name').style.color = '#dc3545'
  });
function initApp() {
  shuffled = shuffleArray([...commands], 12345);
  const today = new Date();
  const utcDate = Date.UTC(today.getUTCFullYear(), today.getUTCMonth(), today.getUTCDate());
  const utcStart = Date.UTC(2025, 0, 1);
  const daysSince = Math.floor((utcDate - utcStart) / 86400000);
  todayIndex = daysSince % shuffled.length;
  currentIndex = todayIndex;
  
  // Check if visitor came from a shared link
  const urlParams = new URLSearchParams(window.location.search);
  if (urlParams.has('shared')) {
    isSharedVisitor = true;
  }
  
  renderDay(todayIndex, 'command-name', 'explanation', false);
  
  document.getElementById('today-btn').addEventListener('click', () => {
    currentIndex = todayIndex;
    isExpanded = true;
    renderDay(todayIndex, 'command-name', 'explanation', true);
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
  
  document.getElementById('share-btn').addEventListener('click', () => {
    const cmd = shuffled[currentIndex];
    const dayLabel = currentIndex === todayIndex ? 'Today' : 'Yesterday';
    const text = `Daily Linux command: ${cmd.name}`;
    const baseUrl = window.location.origin + window.location.pathname;
    const url = `${baseUrl}?shared=true`;
    if (navigator.share) {
      navigator.share({ title: 'Daily Linux Command', text, url });
    } else {
      navigator.clipboard.writeText(`${text}\n${url}`);
      alert('Link copied!');
    }
  });
}
function renderDay(index, nameElId, expElId, autoExpand = false) {
  const i = (index + shuffled.length) % shuffled.length;
  const cmd = shuffled[i];
  const nameEl = document.getElementById(nameElId);
  nameEl.textContent = cmd.name;
  
  // Reset animation by removing and re-adding the class
  nameEl.classList.remove('animate-in');
  // Trigger reflow to restart animation
  void nameEl.offsetWidth;
  nameEl.classList.add('animate-in');
  
  // Clear existing content first
  const exp = document.getElementById(expElId);
  const desc = exp.querySelector('p');
  const list = exp.querySelector('ul');
  const existingProtip = exp.querySelector('.protip');
  if (existingProtip) existingProtip.remove();
  
  // Update content
  desc.textContent = cmd.description;
  list.innerHTML = cmd.examples.map((ex, idx) => {
    const command = typeof ex === 'string' ? ex : ex.cmd;
    const description = typeof ex === 'object' && ex.desc ? ex.desc : '';
    return `
    <li class="${idx === 0 ? 'visible' : ''}">
      <div class="example-content">
        <code>${command}</code>
        ${description ? `<span class="example-desc">→ ${description}</span>` : ''}
      </div>
      <button class="copy-btn" onclick="copyExample('${command.replace(/'/g, "\\'")}', this)">Copy</button>
    </li>
  `}).join('');
  
  // Add pro tip if exists
  if (cmd.protip) {
    const protipEl = document.createElement('div');
    protipEl.className = 'protip';
    protipEl.innerHTML = `<strong>💡 Pro tip:</strong> ${cmd.protip}`;
    exp.appendChild(protipEl);
  }
  
  // Move nav container to the end (after protip if it exists)
  const navContainer = exp.querySelector('.nav-container');
  if (navContainer) {
    exp.appendChild(navContainer);
  }
  
  // Setup click handler for expanding details
  const terminalContainer = document.getElementById('terminal-container');
  
  const commandClickHandler = (e) => {
    // Only allow expanding when viewing Today, not collapsing
    if (currentIndex !== todayIndex) return;
    
    // Only expand if hidden, don't allow collapsing
    if (exp.classList.contains('hidden')) {
      exp.classList.remove('hidden');
      isExpanded = true;
      terminalContainer.classList.add('focused');
      
      // Hide cursor immediately when clicking
      const cursor = document.querySelector('.cursor');
      if (cursor) {
        cursor.classList.add('hidden-cursor');
      }
      
      // Animate examples sequentially
      const examples = list.querySelectorAll('li');
      const protip = exp.querySelector('.protip');
      const delay = 3500; // 3.5 seconds between each
      
      examples.forEach((example, idx) => {
        setTimeout(() => {
          example.classList.add('visible');
        }, idx * delay);
      });
      
      // Show protip and navigation after all examples
      const protipDelay = examples.length * delay;
      
      if (protip) {
        setTimeout(() => {
          protip.classList.add('visible');
        }, protipDelay);
      }
      
      // Show navigation at same time as protip
      setTimeout(() => {
        showNavigation();
        updateNavigation();
        updateTodayButton();
        updateActiveTab();
      }, protipDelay);
    }
    // Removed the else block - no collapsing allowed!
  };
  
  // Remove old listener and add new one - only on container
  if (terminalContainer) {
    terminalContainer.removeEventListener('click', window.commandClickHandler);
    window.commandClickHandler = commandClickHandler;
    terminalContainer.addEventListener('click', commandClickHandler);
  }
  
  // Show command text and hide prompt after typing animation completes
  // typing animation is 1s with delay 1.5s = total 2.5s
  // Add extra 800ms delay before prompt fades out
  setTimeout(() => {
    const cmdEl = document.getElementById(nameElId);
    const promptEl = document.querySelector('.prompt-text');
    const spaceEl = document.querySelector('.space');
    
    if (cmdEl) {
      cmdEl.classList.add('visible');
    }
    if (promptEl) {
      promptEl.classList.add('hide');
    }
    if (spaceEl) {
      spaceEl.classList.add('hide');
    }
  }, 3300);
  
  // Auto-expand if requested or if already expanded
  if (autoExpand || isExpanded) {
    exp.classList.remove('hidden');
    
    // Hide cursor immediately
    const cursor = document.querySelector('.cursor');
    if (cursor) {
      cursor.classList.add('hidden-cursor');
    }
    
    // Show everything immediately without animation
    const examples = list.querySelectorAll('li');
    const protip = exp.querySelector('.protip');
    
    examples.forEach((example) => {
      example.classList.add('visible');
    });
    
    if (protip) {
      protip.classList.add('visible');
    }
    
    // Show navigation immediately
    showNavigation();
    updateNavigation();
    updateTodayButton();
    updateActiveTab();
    updateCoffeeLink();
  }
}

function showNavigation() {
  document.getElementById('prev-command').classList.add('visible');
  document.getElementById('share-btn').classList.add('visible');
  updateCoffeeLink();
}

function hideNavigation() {
  document.getElementById('prev-command').classList.remove('visible');
  document.getElementById('share-btn').classList.remove('visible');
  updateCoffeeLink();
}

function updateCoffeeLink() {
  const coffeeLink = document.getElementById('coffee-link');
  
  // Once shown, keep it visible
  if (coffeeHasBeenShown) {
    coffeeLink.classList.add('visible');
    return;
  }
  
  if (isSharedVisitor && isExpanded) {
    // Shared visitors: show coffee link when they interact (expand any day)
    coffeeLink.classList.add('visible');
    coffeeHasBeenShown = true;
  } else if (!isSharedVisitor && currentIndex === todayIndex - 1) {
    // Fresh visitors: show on Yesterday and keep visible after that
    coffeeLink.classList.add('visible');
    coffeeHasBeenShown = true;
  } else {
    // Hide coffee link (only before it's been shown)
    coffeeLink.classList.remove('visible');
  }
}

function copyExample(text, button) {
  navigator.clipboard.writeText(text).then(() => {
    const originalText = button.textContent;
    button.textContent = 'Copied!';
    button.classList.add('copied');
    setTimeout(() => {
      button.textContent = originalText;
      button.classList.remove('copied');
    }, 2000);
  });
}
function renderNavDay(index, elId, label = '', clickIndex = null) {
  const i = (index + shuffled.length) % shuffled.length;
  const el = document.getElementById(elId);
  el.textContent = label;
  
  if (clickIndex !== null) {
    el.style.cursor = 'pointer';
    el.onclick = () => {
      currentIndex = clickIndex;
      renderDay(clickIndex, 'command-name', 'explanation', true);
      updateNavigation();
      updateTodayButton();
    };
  } else {
    el.onclick = null;
    el.style.cursor = 'default';
  }
}

function updateNavigation() {
  const prevEl = document.getElementById('prev-command');
  
  if (currentIndex === todayIndex) {
    // We're on Today
    prevEl.textContent = 'Yesterday';
    prevEl.classList.add('visible');
    prevEl.onclick = () => {
      currentIndex = todayIndex - 1;
      isExpanded = true;
      renderDay(currentIndex, 'command-name', 'explanation', true);
      window.scrollTo({ top: 0, behavior: 'smooth' });
    };
  } else if (currentIndex === todayIndex - 1) {
    // We're on Yesterday
    prevEl.classList.remove('visible');
    prevEl.onclick = null;
  }
}

function updateTodayButton() {
  const todayBtn = document.getElementById('today-btn');
  
  if (currentIndex === todayIndex) {
    // We're viewing today - hide Today button
    todayBtn.classList.remove('visible');
  } else if (currentIndex < todayIndex) {
    // We're viewing yesterday - show Today button
    todayBtn.classList.add('visible');
  }
}

function updateActiveTab() {
  const prevEl = document.getElementById('prev-command');
  const todayBtn = document.getElementById('today-btn');
  
  // Remove underline from all
  prevEl.style.textDecoration = 'none';
  todayBtn.style.textDecoration = 'none';
  
  // Add underline to active tab
  if (currentIndex === todayIndex - 1) {
    // Yesterday is active
    prevEl.style.textDecoration = 'underline';
  }
}
function shuffleArray(array, seed) {
  let m = array.length, t, i;
  let rand = seed;
  while (m) {
    i = Math.floor(random(seed) * m--);
    t = array[m]; array[m] = array[i]; array[i] = t;
    ++seed;
  }
  return array;
  function random(seed) {
    const x = Math.sin(seed++) * 10000;
    return x - Math.floor(x);
  }
}
