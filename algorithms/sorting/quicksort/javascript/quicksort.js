const quicksort = (array) => {
  if (array.length < 2) return array;

  const pivot = array[0];
  const smallerThanPivot = array.slice(1).filter(e => e <= pivot);
  const greaterThanPivot = array.slice(1).filter(e => e > pivot);

  return quicksort(smallerThanPivot).concat([pivot], quicksort(greaterThanPivot));
}

module.exports = { quicksort };