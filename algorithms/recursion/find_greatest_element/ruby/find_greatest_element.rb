def find_greatest_element(array)
  return if array.empty?
  return array.first if array.size == 1

  head = array.first
  max_from_remaining = find_greatest_element(array[1..-1])

  head >= max_from_remaining ? head : max_from_remaining
end

# Alternative version with a different way to define base case
def find_greatest_element_versio_two(array)
  if array.size == 2
    array[0] >= array[1] ? array[0] : array[1]
  end

  head = array.first
  max_from_remaining = find_greatest_element(array[1..-1])

  head >= max_from_remaining ? head : max_from_remaining
end
