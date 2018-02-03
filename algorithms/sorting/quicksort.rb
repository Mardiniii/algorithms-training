require 'byebug'

def quicksort(array)
  return array if array.size < 2

  left = right = []

  pivot_index = array.size - 1
  pivot_value = array[pivot_index]

  array.pop

  array.each do |item|
    item < pivot_value ? left.push(item) : right.push(item)
  end

  quicksort(left) + [pivot_value] + quicksort(right)
end

describe 'quicksort works correctly' do
  let(:empty_array) { [ ] }
  let(:array_one) { [3] }
  let(:array_two) { [5, 3] }
  let(:array_three) { [8, 5, 3] }
  let(:array_four) { [9, 16, 8, 5, 3, 21, 17, 14] }

  it "is organizing correctly different array sizes" do
    expect(quicksort(array_one)).to eq [3]
    expect(quicksort(array_two)).to eq [3, 5]
    expect(quicksort(array_three)).to eq [3, 5, 8]
    expect(quicksort(array_four)).to eq [3, 5, 8, 9, 14, 16, 17, 21]
  end

  it "it works correctly when receive an empty array" do
    expect(quicksort(empty_array)).to eq []
  end
end
