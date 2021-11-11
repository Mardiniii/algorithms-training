def selection_sort(array)
  sorted_array = []

  array.size.times do
    smallest_index = find_smallest_element_index(array)
    sorted_array.append(array.delete_at(smallest_index))
  end

  sorted_array
end


def find_smallest_element_index(array)
  return if array.empty?

  smallest = array.first
  smallest_index = 0

  array.each_with_index do |element, index|
    if element < smallest
      smallest = element
      smallest_index = index
    end
  end

  smallest_index
end
