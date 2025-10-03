// app.js - lógica de la app (almacena datos en localStorage)
(function(){
  // selectores
  const quitDateEl = document.getElementById('quitDate');
  const dailyCigsEl = document.getElementById('dailyCigs');
  const pricePackEl = document.getElementById('pricePack');
  const cigsPerPackEl = document.getElementById('cigsPerPack');
  const saveConfigBtn = document.getElementById('saveConfig');
  const resetConfigBtn = document.getElementById('resetConfig');

  const daysFreeEl = document.getElementById('daysFree');
  const cigsAvoidedEl = document.getElementById('cigsAvoided');
  const moneySavedEl = document.getElementById('moneySaved');
  const progressBarEl = document.getElementById('progressBar');
  const logSlipBtn = document.getElementById('logSlip');
  const slipCountEl = document.getElementById('slipCount');

  const entryTextEl = document.getElementById('entryText');
  const addEntryBtn = document.getElementById('addEntry');
  const clearEntriesBtn = document.getElementById('clearEntries');
  const entriesListEl = document.getElementById('entriesList');

  // claves localStorage
  const KEY = 'dejafumar_app_v1';

  // estado por defecto
  const defaultState = {
    quitDate: null,
    dailyCigs: 10,
    pricePack: 5.00,
    cigsPerPack: 20,
    slips: 0,
    journal: []
  };

  // cargar estado
  function loadState(){
    try{
      const raw = localStorage.getItem(KEY);
      return raw ? JSON.parse(raw) : {...defaultState};
    }catch(e){
      console.error('Error leyendo localStorage', e);
      return {...defaultState};
    }
  }

  function saveState(state){
    localStorage.setItem(KEY, JSON.stringify(state));
  }

  // estado actual
  let state = loadState();

  // rellenar formulario desde estado
  function populateConfig(){
    if(state.quitDate) quitDateEl.value = state.quitDate;
    dailyCigsEl.value = state.dailyCigs ?? defaultState.dailyCigs;
    pricePackEl.value = state.pricePack ?? defaultState.pricePack;
    cigsPerPackEl.value = state.cigsPerPack ?? defaultState.cigsPerPack;
    slipCountEl.textContent = `Deslices: ${state.slips || 0}`;
  }

  // utilidades
  function daysBetween(d1, d2){
    const msDay = 1000*60*60*24;
    return Math.floor((d2 - d1)/msDay);
  }

  function currencyFmt(v){
    return new Intl.NumberFormat('es-ES',{style:'currency',currency:'EUR'}).format(v);
  }

  // actualizar métricas en pantalla
  function updateStats(){
    if(!state.quitDate){
      daysFreeEl.textContent = '0';
      cigsAvoidedEl.textContent = '0';
      moneySavedEl.textContent = currencyFmt(0);
      progressBarEl.style.width = '0%';
      return;
    }
    const today = new Date();
    const q = new Date(state.quitDate + 'T00:00:00');
    let days = daysBetween(q, new Date(today.getFullYear(), today.getMonth(), today.getDate()));
    if(days < 0) days = 0;
    const cigsAvoided = Math.round(days * (state.dailyCigs || defaultState.dailyCigs));
    const moneySaved = (cigsAvoided / (state.cigsPerPack || defaultState.cigsPerPack)) * (state.pricePack || defaultState.pricePack);
    daysFreeEl.textContent = String(days);
    cigsAvoidedEl.textContent = String(cigsAvoided);
    moneySavedEl.textContent = currencyFmt(moneySaved || 0);
    const progress = Math.min(100, Math.round((days / 30) * 100));
    progressBarEl.style.width = progress + '%';
    slipCountEl.textContent = `Deslices: ${state.slips || 0}`;
  }

  // acciones configuración
  saveConfigBtn.addEventListener('click', () => {
    const q = quitDateEl.value || null;
    state.quitDate = q;
    state.dailyCigs = Number(dailyCigsEl.value) || 0;
    state.pricePack = Number(pricePackEl.value) || 0;
    state.cigsPerPack = Number(cigsPerPackEl.value) || 20;
    saveState(state);
    updateStats();
    alert('Configuración guardada.');
  });

  resetConfigBtn.addEventListener('click', () => {
    if(!confirm('¿Deseas reiniciar la configuración y borrar deslices y diario?')) return;
    state = {...defaultState};
    saveState(state);
    populateConfig();
    renderJournal();
    updateStats();
  });

  // desliz (slip)
  logSlipBtn.addEventListener('click', () => {
    state.slips = (state.slips || 0) + 1;
    // añade nota automática al diario
    const note = {
      id: Date.now(),
      text: 'Desliz registrado manualmente.',
      date: new Date().toISOString()
    };
    state.journal.unshift(note);
    saveState(state);
    renderJournal();
    updateStats();
    alert('Desliz registrado. Ánimo, sigue adelante.');
  });

  // diario
  function renderJournal(){
    entriesListEl.innerHTML = '';
    if(!state.journal || state.journal.length === 0){
      const li = document.createElement('li');
      li.className = 'muted';
      li.textContent = 'No hay entradas aún.';
      entriesListEl.appendChild(li);
      return;
    }
    state.journal.forEach(entry => {
      const li = document.createElement('li');
      const time = new Date(entry.date).toLocaleString();
      li.innerHTML = `<div style="font-size:0.85rem;color:var(--muted)">${time}</div><div style="margin-top:6px">${escapeHtml(entry.text)}</div>`;
      entriesListEl.appendChild(li);
    });
  }

  function escapeHtml(s){
    return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
  }

  addEntryBtn.addEventListener('click', () => {
    const text = entryTextEl.value.trim();
    if(!text) { alert('Escribe algo antes de añadir.'); return; }
    const e = { id: Date.now(), text, date: new Date().toISOString() };
    state.journal.unshift(e);
    entryTextEl.value = '';
    saveState(state);
    renderJournal();
  });

  clearEntriesBtn.addEventListener('click', () => {
    if(!confirm('Borrar todo el diario?')) return;
    state.journal = [];
    saveState(state);
    renderJournal();
  });

  // inicialización
  (function init(){
    populateConfig();
    renderJournal();
    updateStats();
    // actualizar estadísticas periódicamente
    setInterval(updateStats, 60*1000);
  })();

})();
