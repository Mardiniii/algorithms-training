def quicksort(array)
  return array if array.size < 2

  pivot = array[0]
  smaller_than_pivot = array[1..-1].select { |e| e <= pivot}
  greater_than_pivot = array[1..-1].select { |e| e > pivot}

  quicksort(smaller_than_pivot) + [pivot] + quicksort(greater_than_pivot)
end

# Alternate approach choosing the last element as the pivot
def alternate_quicksort(array)
  return array if array.size < 2

  left = []
  right = []

  pivot_index = array.size - 1
  pivot_value = array[pivot_index]

  array.pop

  array.each do |item|
    item < pivot_value ? left.push(item) : right.push(item)
  end

  quicksort(left) + [pivot_value] + quicksort(right)
end
