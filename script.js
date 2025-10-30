const commands = [];
let shuffled = [];
let todayIndex = 0;
let currentIndex = 0;
let isExpanded = false;
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
  renderDay(todayIndex, 'command-name', 'explanation', false);
  
  document.getElementById('today-btn-top').addEventListener('click', () => {
    currentIndex = todayIndex;
    isExpanded = true;
    renderDay(todayIndex, 'command-name', 'explanation', true);
  });
  
  document.getElementById('today-btn-bottom').addEventListener('click', () => {
    currentIndex = todayIndex;
    isExpanded = true;
    renderDay(todayIndex, 'command-name', 'explanation', true);
  });
  
  document.getElementById('share-btn').addEventListener('click', () => {
    const cmd = shuffled[todayIndex];
    const text = `Today's Linux command: ${cmd.name} – ${cmd.description}`;
    const url = window.location.href;
    if (navigator.share) {
      navigator.share({ title: 'Daily Command', text, url });
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
    <li>
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
  
  nameEl.onclick = () => {
    if (exp.classList.contains('hidden')) {
      exp.classList.remove('hidden');
      isExpanded = true;
      showNavigation();
      updateNavigation();
      updateTodayButton();
      updateActiveTab();
    } else {
      exp.classList.add('hidden');
      isExpanded = false;
      hideNavigation();
    }
  };
  
  // Auto-expand if requested or if already expanded
  if (autoExpand || isExpanded) {
    exp.classList.remove('hidden');
    showNavigation();
    updateNavigation();
    updateTodayButton();
    updateActiveTab();
  }
}

function showNavigation() {
  document.getElementById('prev-command').classList.add('visible');
  document.querySelector('.buttons').classList.add('visible');
}

function hideNavigation() {
  document.getElementById('prev-command').classList.remove('visible');
  document.querySelector('.buttons').classList.remove('visible');
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
    };
  } else if (currentIndex === todayIndex - 1) {
    // We're on Yesterday
    prevEl.classList.remove('visible');
    prevEl.onclick = null;
  }
}

function updateTodayButton() {
  const todayBtnTop = document.getElementById('today-btn-top');
  const todayBtnBottom = document.getElementById('today-btn-bottom');
  
  if (currentIndex === todayIndex) {
    // We're viewing today - hide both
    todayBtnTop.classList.remove('visible');
    todayBtnBottom.classList.remove('visible');
  } else if (currentIndex < todayIndex) {
    // We're viewing yesterday - show Today at bottom
    todayBtnTop.classList.remove('visible');
    todayBtnBottom.classList.add('visible');
  }
}

function updateActiveTab() {
  const prevEl = document.getElementById('prev-command');
  const todayBtnTop = document.getElementById('today-btn-top');
  const todayBtnBottom = document.getElementById('today-btn-bottom');
  
  // Remove underline from all
  prevEl.style.textDecoration = 'none';
  todayBtnTop.style.textDecoration = 'none';
  todayBtnBottom.style.textDecoration = 'none';
  
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
