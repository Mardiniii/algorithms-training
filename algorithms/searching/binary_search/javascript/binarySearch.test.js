const { binarySearch } = require('./binarySearch');

const array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

it.each([
  { array: array, target: 1, expectation: 0 },
  { array: array, target: 2, expectation: 1 },
  { array: array, target: 3, expectation: 2 },
  { array: array, target: 10, expectation: 9 },
  { array: array, target: 11, expectation: null },
])('finds the target\'s in the given array: %j', (t) => {
  const result = binarySearch(t.array, t.target);
  expect(result).toEqual(t.expectation);
});
