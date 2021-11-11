const binarySearch = (array, target) => {
  let low = 0;
  let high = array.length - 1;

  while (low <= high) {
    let middle = Math.floor((low + high) / 2);
    let guess = array[middle]
    if (guess == target) {
      return middle;
    } else if (guess > target) {
      high = middle - 1;
    } else {
      low = middle + 1;
    }
  }

  return null;
};

module.exports = { binarySearch };
