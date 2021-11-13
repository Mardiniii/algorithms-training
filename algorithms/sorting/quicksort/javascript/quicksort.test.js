const { quicksort } = require('./quicksort');

it.each([
  { array: [], expectation: [] },
  { array: [2, 1], expectation: [1, 2] },
  { array: [2, 5, 3, 15, 1], expectation: [1, 2, 3, 5, 15] },
  { array: [5, 4, 3, 2, 1, 0], expectation: [0, 1, 2, 3, 4, 5] },
  { array: [1, 2, 6, 5, 4, 7, 8], expectation: [1, 2, 4, 5, 6, 7, 8] },
  { array: [14, 13, 23, 21, 8, 5, 48, 24], expectation: [5, 8, 13, 14, 21, 23, 24, 48] },
])('sorts the given array using quicksort algorithm: %j', (t) => {
  const result = quicksort(t.array);
  expect(result).toEqual(t.expectation);
});
