const findGreatestElement = (array) => {
  if (array.length === 0) return null;
  if (array.length === 1) return array[0];

  const max = array[0];
  const maxFromRemaining = findGreatestElement(array.slice(1));

  return max >= maxFromRemaining ? max : maxFromRemaining
};

module.exports = { findGreatestElement };
