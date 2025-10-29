const commands = [];
let shuffled = [];
let todayIndex = 0;
let currentIndex = 0;
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
  renderNavDay(todayIndex - 1, 'prev-command', 'Yesterday', todayIndex - 1);
  renderNavDay(todayIndex + 1, 'next-command', 'Tomorrow', todayIndex + 1);
  updateTodayButton();
  
  document.getElementById('today-btn').addEventListener('click', () => {
    currentIndex = todayIndex;
    renderDay(todayIndex, 'command-name', 'explanation', false);
    updateTodayButton();
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
function renderDay(index, nameElId, expElId, showExp = false) {
  const i = (index + shuffled.length) % shuffled.length;
  const cmd = shuffled[i];
  const nameEl = document.getElementById(nameElId);
  nameEl.textContent = cmd.name;
  nameEl.onclick = () => {
    const exp = document.getElementById(expElId);
    const desc = exp.querySelector('p');
    const list = exp.querySelector('ul');
    if (exp.classList.contains('hidden')) {
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
      
      exp.classList.remove('hidden');
      
      // Show navigation and buttons
      showNavigation();
    } else {
      exp.classList.add('hidden');
      // Remove protip if exists
      const existingProtip = exp.querySelector('.protip');
      if (existingProtip) existingProtip.remove();
      
      // Hide navigation and buttons
      hideNavigation();
    }
  };
  if (showExp && expElId === 'explanation') nameEl.click();
}

function showNavigation() {
  document.getElementById('prev-command').classList.add('visible');
  document.getElementById('next-command').classList.add('visible');
  document.querySelector('.buttons').classList.add('visible');
}

function hideNavigation() {
  document.getElementById('prev-command').classList.remove('visible');
  document.getElementById('next-command').classList.remove('visible');
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
      updateTodayButton();
    };
  } else {
    el.onclick = null;
    el.style.cursor = 'default';
  }
}

function updateTodayButton() {
  const todayBtn = document.getElementById('today-btn');
  if (currentIndex === todayIndex) {
    todayBtn.style.display = 'none';
  } else {
    todayBtn.style.display = 'inline-block';
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
