def bubble_sort(array)
  # Flag variable to sort again
  do_it_again = false

  # Loop variables
  limit = array.length
  default_next_val = Float::INFINITY

  # Loop over the list entries
  limit.times do |index|
    # Current list value
    current_value = array[index]

    # The next value inline, which we'll default to a really high number
    next_value = index + 1 < limit ? array[ index + 1 ] : default_next_val

    if next_value < current_value
      array[index] = next_value
      array[index + 1] = current_value

      do_it_again = true
    end

    bubble_sort(array) if do_it_again
  end

  array
end

describe 'bubble_sort works correctly' do
  let(:empty_array) { [ ] }
  let(:array_one) { [3] }
  let(:array_two) { [5, 3] }
  let(:array_three) { [8, 5, 3] }
  let(:array_four) { [9, 16, 8, 5, 3, 21, 17, 14] }

  it "is organizing correctly different array sizes" do
    expect(bubble_sort(array_one)).to eq [3]
    expect(bubble_sort(array_two)).to eq [3 , 5]
    expect(bubble_sort(array_three)).to eq [3 , 5, 8]
    expect(bubble_sort(array_four)).to eq [3 , 5, 8, 9, 14, 16, 17, 21]
  end

  it "it works correctly when receive an empty array" do
    expect(bubble_sort(empty_array)).to eq [ ]
  end
end
