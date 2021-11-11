const selectionSort = (array) => {
  let sortedArray = [];
  let iterations = array.length

  for (let i = 0; i < iterations; i++) {
    let smallestIndex = findSmallestElementIndex(array);
    let smallest = array[smallestIndex];

    array = array.filter(e => e !== smallest);
    sortedArray.push(smallest);
  }

  return sortedArray;
};


const findSmallestElementIndex = (array) => {
  if (array.length === 0) return null ;

  let smallestIndex = 0;
  let smallest = array[smallestIndex];

  for (let i = 1; i < array.length; i++ ) {
    if (array[i] < smallest) {
      smallestIndex = i;
      smallest = array[i];
    }
  }

  return smallestIndex;
};

module.exports = { findSmallestElementIndex, selectionSort };
