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

const array = [1,2,3,4,5,6,7,8,9,10]

console.log(`Searching 1 in ${array} - Expected result: 0 - Result: `, binarySearch(array, 1));
console.log(`Searching 2 in ${array} - Expected result: 1 - Result: `, binarySearch(array, 2));
console.log(`Searching 3 in ${array} - Expected result: 2 - Result: `, binarySearch(array, 3));
console.log(`Searching 10 in ${array} - Expected result: 9 - Result: `, binarySearch(array, 10));
console.log(`Searching 11 in ${array} - Expected result: null - Result: `, binarySearch(array, 11));
