import { test } from 'node:test';
import assert from 'node:assert/strict';
import { competitionCard } from '../src/competition-card.js';

test('competition card capitalizes every word in federation name', () => {
  const body = '<body><div class="page-head"><h1>Турнир</h1></div></body>';
  const comp = {
    name: 'Турнир',
    date_start: '2026-01-01',
    city: 'Москва',
    federation_name: 'Всероссийская федерация гиревого спорта',
    rank_name: 'Всероссийский',
  };

  const html = competitionCard(body, comp, []);

  assert.match(html, /Всероссийская Федерация Гиревого Спорта/);
  assert.doesNotMatch(html, /Всероссийская федерация гиревого спорта/);
});
