def contains?(ordered_array, number)
  floor_index = -1
  ceiling_index = ordered_array.length

  while floor_index + 1 < ceiling_index
    distance = ceiling_index - floor_index
    half_distance = distance / 2
    guess_index = floor_index + half_distance

    guess_value = ordered_array[guess_index]

    if guess_value == number
      return true
    elsif guess_value > number
      ceiling_index = guess_index
    else
      floor_index = guess_index
    end
  end

  false
end

# Tests

def run_tests
  desc = 'empty array'
  result = contains?([], 1)
  assert_false(result, desc)

  desc = 'one item array number present'
  result = contains?([1], 1)
  assert_true(result, desc)

  desc = 'one item array number absent'
  result = contains?([1], 2)
  assert_false(result, desc)

  desc = 'small array number present'
  result = contains?([2, 4, 6], 4)
  assert_true(result, desc)

  desc = 'small array number absent'
  result = contains?([2, 4, 6], 5)
  assert_false(result, desc)

  desc = 'large array number present'
  result = contains?([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 8)
  assert_true(result, desc)

  desc = 'large array number absent'
  result = contains?([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0)
  assert_false(result, desc)

  desc = 'large array number first'
  result = contains?([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1)
  assert_true(result, desc)

  desc = 'large array number last'
  result = contains?([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 10)
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
