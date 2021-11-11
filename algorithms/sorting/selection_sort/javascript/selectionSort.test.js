const { findSmallestElementIndex, selectionSort } = require('./selectionSort');

it.each([
  { array: [], expectation: null },
  { array: [5, 4, 3, 2, 1, 0], expectation: 5 },
  { array: [1, 2, 6, 5, 4, 7, 8], expectation: 0 },
  { array: [14, 13, 23, 21, 8, 48, 5, 24], expectation: 6 },
])('finds the index of the smallest element in the array: %j', (t) => {
  const result = findSmallestElementIndex(t.array);
  expect(result).toEqual(t.expectation);
});

it.each([
  { array: [], expectation: [] },
  { array: [5, 4, 3, 2, 1, 0], expectation: [0, 1, 2, 3, 4, 5] },
  { array: [1, 2, 6, 5, 4, 7, 8], expectation: [1, 2, 4, 5, 6, 7, 8] },
  { array: [14, 13, 23, 21, 8, 5, 48, 24], expectation: [5, 8, 13, 14, 21, 23, 24, 48] },
])('sorts the given array using selectionSort algorithm: %j', (t) => {
  const result = selectionSort(t.array);
  expect(result).toEqual(t.expectation);
});
