const { sumFunction } = require('./sumFunction');

it.each([
  { array: [], expectation: 0 },
  { array: [8], expectation: 8 },
  { array: [1, 2, 3, 4, 5, 6], expectation: 21 },
])('adds up all the elements and returns the total: %j', (t) => {
  const result = sumFunction(t.array);
  expect(result).toEqual(t.expectation);
});
