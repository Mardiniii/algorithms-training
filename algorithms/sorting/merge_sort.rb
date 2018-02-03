def merge_sort(array)
  # Check if the array isn't empty
  return array if array.size <= 1

  # Cut the array in half
  middle = array.size / 2

  # Divide and conquer style
  left = array.slice(0, middle)
  right = array.slice(middle, array.size)

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  result = [ ]

  while left.any? || right.any? do
    # When both list have elements
    if left.any? && right.any?
      left[0] < right[0] ? result.push(left.shift()) : result.push(right.shift())
    # Only when the left list has elements
  elsif left.any?
      result.push(left.shift())
    # Otherwhise return the right list
    else
      result.push(right.shift())
    end
  end

  result
end

describe 'merge_sort works correctly' do
  let(:empty_array) { [ ] }
  let(:array_one) { [3] }
  let(:array_two) { [5, 3] }
  let(:array_three) { [8, 5, 3] }
  let(:array_four) { [9, 16, 8, 5, 3, 21, 17, 14] }

  it "is organizing correctly different array sizes" do
    expect(merge_sort(array_one)).to eq [3]
    expect(merge_sort(array_two)).to eq [3 , 5]
    expect(merge_sort(array_three)).to eq [3 , 5, 8]
    expect(merge_sort(array_four)).to eq [3 , 5, 8, 9, 14, 16, 17, 21]
  end

  it "it works correctly when receive an empty array" do
    expect(merge_sort(empty_array)).to eq [ ]
  end
end
