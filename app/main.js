const PRIORITY = {
  safety: 1,
  comfort: 2,
  behavior: 3,
};

const RULES = [
  {
    id: 'umbrella',
    title: '☔ 우산',
    message: '비 올 확률이 높아요. 우산 챙겨요.',
    category: 'safety',
    when: (w) => w.rainChance >= 60,
  },
  {
    id: 'mask',
    title: '😷 마스크',
    message: '공기가 탁해요. 마스크 챙기면 좋아요.',
    category: 'safety',
    when: (w) => w.dust === 'bad' || w.dust === 'very-bad',
  },
  {
    id: 'outer',
    title: '🧥 겉옷',
    message: '체감온도가 낮아요. 겉옷 추천해요.',
    category: 'safety',
    when: (w) => w.feelsLike <= 10,
  },
  {
    id: 'sunscreen',
    title: '🧴 선크림',
    message: '자외선이 강해요. 선크림 발라요.',
    category: 'comfort',
    when: (w) => w.uv === 'high' || w.uv === 'very-high',
  },
  {
    id: 'water',
    title: '💧 물',
    message: '더울 수 있어요. 물 챙겨요.',
    category: 'comfort',
    when: (w) => w.temp >= 28,
  },
  {
    id: 'early',
    title: '⏰ 출발 시간 조정',
    message: '바람이 강해요. 조금 일찍 출발해요.',
    category: 'behavior',
    when: (w) => w.wind >= 8,
  },
];

function readWeather() {
  return {
    temp: Number(document.querySelector('#temp').value || 0),
    feelsLike: Number(document.querySelector('#feelsLike').value || 0),
    rainChance: Number(document.querySelector('#rainChance').value || 0),
    dust: document.querySelector('#dust').value,
    wind: Number(document.querySelector('#wind').value || 0),
    uv: document.querySelector('#uv').value,
  };
}

function briefLine(w) {
  const parts = [`현재 ${w.temp}°C`, `체감 ${w.feelsLike}°C`, `강수 ${w.rainChance}%`];
  if (w.rainChance >= 60 || w.wind >= 8) parts.push('이동 전 체크 필요');
  if (w.feelsLike <= 10) parts.push('보온 필요');
  if (w.dust === 'bad' || w.dust === 'very-bad') parts.push('공기질 주의');
  return parts.join(' · ');
}

function evaluate(w) {
  return RULES
    .filter((rule) => rule.when(w))
    .sort((a, b) => PRIORITY[a.category] - PRIORITY[b.category])
    .slice(0, 3);
}

function renderCards(items) {
  const cards = document.querySelector('#cards');

  if (items.length === 0) {
    cards.innerHTML = `<article class="card"><h3>✅ 오늘은 기본 준비로 충분해요</h3><p>날씨 리스크가 낮아요. 평소 루틴으로 출발해요.</p></article>`;
    return;
  }

  cards.innerHTML = items
    .map(
      (item) => `
      <article class="card ${item.category}">
        <h3>${item.title}</h3>
        <p>${item.message}</p>
      </article>
    `,
    )
    .join('');
}

function generateBrief() {
  const weather = readWeather();
  const items = evaluate(weather);
  document.querySelector('#summary').textContent = briefLine(weather);
  renderCards(items);
}

document.querySelector('#generate').addEventListener('click', generateBrief);
window.addEventListener('DOMContentLoaded', generateBrief);
