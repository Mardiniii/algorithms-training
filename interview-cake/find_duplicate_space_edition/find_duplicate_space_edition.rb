def find_repeat(numbers)
  floor, ceiling = 1, numbers.length - 1

  while floor < ceiling
    midpoint = floor + (ceiling - floor) / 2
    lower_range_floor, lower_range_ceiling = floor, midpoint
    upper_range_floor, upper_range_ceiling = midpoint + 1, ceiling

    items_in_lower_range = numbers.count do |item|
      item >= lower_range_floor && item <= lower_range_ceiling
    end

    distinct_possible_integers_in_lower_range =
      lower_range_ceiling - lower_range_floor + 1

    if items_in_lower_range > distinct_possible_integers_in_lower_range
      floor, ceiling = lower_range_floor, lower_range_ceiling
    else
      floor, ceiling = upper_range_floor, upper_range_ceiling
    end
  end

  floor
end

def run_tests
  desc = 'just the repeated number'
  actual = find_repeat([1, 1])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'short array'
  actual = find_repeat([1, 2, 3, 2])
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_repeat([1, 2, 5, 5, 5, 5])
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'long array'
  actual = find_repeat([4, 1, 4, 8, 3, 2, 7, 6, 5])
  expected = 4
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
