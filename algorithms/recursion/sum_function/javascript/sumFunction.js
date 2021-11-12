// Problem: Given an array of numbers, define a recursive function to add up all
// the numbers and return the total.

const sumFunction = (array) => {
  if (array.length === 0) return 0;

  return array[0] + sumFunction(array.slice(1));
};

module.exports = { sumFunction };
