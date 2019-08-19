def get_random(floor, ceiling)
  rand(floor..ceiling)
end

# Fisher-Yates shuffle - Knuth Shuffle
def shuffle(array)
  return array if array.length <= 1

  # Shuffle the input in place
  array.each.with_index do |current, current_index|
    random_index = get_random(current_index, array.length - 1)

    temp = array[random_index]
    array[random_index] = current
    array[current_index] = temp
  end

  array
end

sample_array = [1, 2, 3, 4, 5]
puts "Sample array: #{sample_array}"

puts 'Shuffling sample array...'
shuffle(sample_array)
puts sample_array.inspect
