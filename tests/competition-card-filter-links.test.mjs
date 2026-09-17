import { test } from 'node:test';
import assert from 'node:assert/strict';
import { competitionCard } from '../src/competition-card.js';

const comp = {
  name: 'Турнир',
  date_start: '2026-01-01',
  city: 'Санкт-Петербург',
  rank_name: 'Чемпионат России',
};

const render = (homeHref) => competitionCard(
  `<body><header><a class="brand" href="${homeHref}">Всегири</a></header><div class="page-head"><h1>Турнир</h1></div></body>`,
  comp,
  [],
);

test('competition card makes city and rank tiles clickable to worker home filters', () => {
  const html = render('/');

  assert.match(html, /class="competition-fact competition-fact-link-wrap"[\s\S]*?Город[\s\S]*?<a class="competition-fact-link" href="\/\?city=%D0%A1%D0%B0%D0%BD%D0%BA%D1%82-%D0%9F%D0%B5%D1%82%D0%B5%D1%80%D0%B1%D1%83%D1%80%D0%B3">Санкт-Петербург<\/a>/);
  assert.match(html, /class="competition-fact competition-fact-link-wrap"[\s\S]*?Уровень[\s\S]*?<a class="competition-fact-link" href="\/\?rank=%D0%A7%D0%B5%D0%BC%D0%BF%D0%B8%D0%BE%D0%BD%D0%B0%D1%82%20%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B8">Чемпионат России<\/a>/);
  assert.equal((html.match(/class="competition-fact competition-fact-link-wrap"/g) || []).length, 2);
  assert.match(html, /\.competition-fact-link::after \{ content:''; position:absolute; inset:0; \}/);
});

test('competition card keeps static index path in filter links', () => {
  const html = render('index.html');

  assert.match(html, /href="index\.html\?city=%D0%A1%D0%B0%D0%BD%D0%BA%D1%82-%D0%9F%D0%B5%D1%82%D0%B5%D1%80%D0%B1%D1%83%D1%80%D0%B3">Санкт-Петербург<\/a>/);
  assert.match(html, /href="index\.html\?rank=%D0%A7%D0%B5%D0%BC%D0%BF%D0%B8%D0%BE%D0%BD%D0%B0%D1%82%20%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B8">Чемпионат России<\/a>/);
});
