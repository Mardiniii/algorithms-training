def binary_search(array, target)
  low = 0
  high = array.size - 1

  while low <= high do
    middle = (low + high) / 2
    guess = array[middle]

    if guess == target
      return middle
    elsif guess > target
      high = middle - 1
    else
      low = middle + 1
    end
  end

  return nil
end
