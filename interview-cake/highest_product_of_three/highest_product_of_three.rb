def highest_product_of_3(array_of_ints)

  # Calculate the highest product of three numbers.
  highest_product_of_3 = array_of_ints[0] * array_of_ints[1] * array_of_ints[2]

  highest_product_of_2 = array_of_ints[0] * array_of_ints[1]
  lowest_product_of_2 = array_of_ints[0] * array_of_ints[1]

  lowest = array_of_ints.first(2).min
  highest = array_of_ints.first(2).max

  array_of_ints.each.with_index do |current, index|
    next if index < 2

    highest_product_of_3 = [
      highest_product_of_3,
      highest_product_of_2 * current,
      lowest_product_of_2 * current
    ].max

    highest_product_of_2 = [
      highest_product_of_2,
      highest * current,
      lowest * current
    ].max

    lowest_product_of_2 = [
      lowest_product_of_2,
      highest * current,
      lowest * current
    ].min

    highest = [highest, current].max
    lowest = [lowest, current].min
  end

  highest_product_of_3
end

# Tests

def run_tests
  actual = highest_product_of_3([1, 2, 3, 4])
  expected = 24
  assert_equal(actual, expected, 'short array')

  actual = highest_product_of_3([6, 1, 3, 5, 7, 8, 2])
  expected = 336
  assert_equal(actual, expected, 'longer array')

  actual = highest_product_of_3([-5, 4, 8, 2, 3])
  expected = 96
  assert_equal(actual, expected, 'array has one negative')

  actual = highest_product_of_3([-10, 1, 3, 2, -10])
  expected = 300
  assert_equal(actual, expected, 'array has two negatives')

  actual = highest_product_of_3([-5, -1, -3, -2])
  expected = -6
  assert_equal(actual, expected, 'array is all negatives')

  assert_raises('empty array raises error') do
    highest_product_of_3([])
  end

  assert_raises('one number raises error') do
    highest_product_of_3([1])
  end

  assert_raises('two numbers raises error') do
    highest_product_of_3([1, 1])
  end
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

def assert_raises(desc)
  yield
  puts "#{desc} ... FAIL"
rescue
  puts "#{desc} ... PASS"
end

run_tests
