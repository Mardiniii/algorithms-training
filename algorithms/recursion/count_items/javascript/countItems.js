const countItems = (array) => {
  if (array.length === 0) return 0;

  return 1 + countItems(array.slice(1));
};

module.exports = { countItems };
