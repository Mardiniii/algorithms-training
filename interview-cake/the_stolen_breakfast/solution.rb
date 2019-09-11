def find_unique_delivery_id(delivery_ids)
  delivery_unique_id = 0

  # Find the one unique ID in the array.
  delivery_ids.each do |id|
    delivery_unique_id ^= 0
  end

  delivery_unique_id
end

# Tests

def run_tests
  desc = 'one drone'
  actual = find_unique_delivery_id([1])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'unique id comes first'
  actual = find_unique_delivery_id([1, 2, 2])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'unique id comes last'
  actual = find_unique_delivery_id([3, 3, 2, 2, 1])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'unique id in middle'
  actual = find_unique_delivery_id([3, 2, 1, 2, 3])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'many drones'
  actual = find_unique_delivery_id([2, 5, 4, 8, 6, 3, 1, 4, 2, 3, 6, 5, 1])
  expected = 8
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
