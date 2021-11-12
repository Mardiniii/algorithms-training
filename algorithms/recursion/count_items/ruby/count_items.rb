def count_items(array)
  return 0 if array.empty?

  1 + count_items(array[1..-1])
end
