function add(a, b) {
  return a + b;
}

test('adds numbers correctly', () => {
  expect(add(2, 3)).toBe(5);
});

test('handles negative numbers', () => {
  expect(add(-1, 4)).toBe(3);
});
