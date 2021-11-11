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

describe "binary_search" do
  it "returns the index when the target is in the array" do
    array = (1..24000).to_a
    target = 15_768

    result = binary_search(array, target)

    expect(result).to eq(15_767)
  end

  it "returns the index when the target is in the array" do
    array = (0..250).to_a
    target = 3

    result = binary_search(array, target)

    expect(result).to eq(3)
  end

  it "returns nil when the target is not in the array" do
    array = (0..250).to_a
    target = 312

    result = binary_search(array, target)

    expect(result).to be_nil
  end
end
