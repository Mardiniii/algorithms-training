def find_rotation_point(words)
  floor_index = -1
  ceiling_index = words.length

  while floor_index + 1 < ceiling_index
    distance = ceiling_index - floor_index
    half_distance = distance / 2

    guess_index = floor_index + half_distance
    guess_value = words[guess_index]

    if guess_value < words[guess_index - 1]
      return guess_index
    elsif guess_value < words.first
      ceiling_index = guess_index
    else
      floor_index = guess_index
    end
  end
  # Find the rotation point in the array

  -1
end

# Tests

def run_tests
  desc = 'small array'
  actual = find_rotation_point(['cape', 'cake'])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_rotation_point(['grape', 'orange', 'plum', 'radish', 'apple'])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'large array'
  actual = find_rotation_point(['ptolemaic', 'retrograde', 'supplant',
                                'undulate', 'xenoepist', 'asymptote',
                                'babka', 'banoffee', 'engender',
                                'karpatka', 'othellolagkage'])
  expected = 5
  assert_equal(actual, expected, desc)

  # Are we missing any edge cases?
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests

# def find_rotation_point(words)
#   first_word = words.first
#
#   floor_index = 0
#   ceiling_index = words.length - 1
#
#   while floor_index < ceiling_index
#
#     # guess a point halfway between floor and ceiling
#     guess_index = (floor_index + ceiling_index) / 2
#
#     # if guess comes after first word or is the first word
#     if words[guess_index] >= first_word
#       # go right
#       floor_index = guess_index
#     else
#       # go left
#       ceiling_index = guess_index
#     end
#
#     # return if floor and ceiling have converged
#     # between floor and ceiling is where we flipped to the beginning
#     # so ceiling is alphabetically first
#     return ceiling_index if floor_index + 1 == ceiling_index
#   end
# end
