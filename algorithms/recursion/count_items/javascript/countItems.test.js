const { countItems } = require('./countItems');

it.each([
  { array: [], expectation: 0 },
  { array: [8], expectation: 1 },
  { array: [1, 2, 3, 4, 5, 6], expectation: 6 },
])('returns the number of elements in the array: %j', (t) => {
  const result = countItems(t.array);
  expect(result).toEqual(t.expectation);
});
