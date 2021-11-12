const { findGreatestElement } = require('./findGreatestElement');

it.each([
  { array: [], expectation: null },
  { array: [8], expectation: 8 },
  { array: [1, 2, 3, 4, 5, 6], expectation: 6 },
])('finds the greatest element from the array: %j', (t) => {
  const result = findGreatestElement(t.array);
  expect(result).toEqual(t.expectation);
});
