const request = require('supertest');
const app = require('../server'); // adjust if your server file is named differently

test('responds with 200 OK on GET /', async () => {
  const response = await request(app).get('/');
  expect(response.statusCode).toBe(200);
});

test('returns JSON or HTML content', async () => {
  const response = await request(app).get('/');
  expect(response.headers['content-type']).toMatch(/(json|html)/);
});
