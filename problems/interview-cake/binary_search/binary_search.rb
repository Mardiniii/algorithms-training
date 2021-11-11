def binary_search(target, array)
  floor_index = -1
  ceiling_index = array.length

  while floor_index + 1 < ceiling_index
    distance = ceiling_index - floor_index
    half_distance = distance / 2
    guess_index = floor_index + half_distance

    guess_value = array[guess_index]

    if guess_value == target
      return true
    elsif guess_value > target
      ceiling_index = guess_index
    else
      floor_index = guess_index
    end
  end

  false
end

puts "Looking for 4"
puts binary_search(4, (1..10).to_a)
puts

puts "Looking for 7"
puts binary_search(7, (1..10).to_a)
puts

puts "Looking for 1"
puts binary_search(1, (1..10).to_a)
puts

puts "Looking for 10"
puts binary_search(10, (1..10).to_a)
puts

puts "Looking for 16"
puts binary_search(16, (1..10).to_a)
puts

puts "Looking for 16 empty array"
puts binary_search(16, [])
puts

puts "Looking for 16 one item array no present"
puts binary_search(16, [1])
puts

puts "Looking for 16 one item array present"
puts binary_search(16, [16])
puts
