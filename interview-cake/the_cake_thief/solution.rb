def max_duffel_bag_value(cake_tuples, weight_capacity)
  max_value_at_capacity = Array.new(weight_capacity + 1, 0)

  (0..weight_capacity).each do |current_capacity|
    current_max_value = 0

    cake_tuples.each do |cake_weight, cake_value|
      if cake_weight == 0 && cake_value > 0
        return Float::INFINITY
      elsif cake_weight <= current_capacity
        max_value_using_cake = cake_value + max_value_at_capacity[current_capacity - cake_weight]
        current_max_value = [max_value_using_cake, current_max_value].max
      end
    end

    max_value_at_capacity[current_capacity] = current_max_value
  end

  max_value_at_capacity[weight_capacity]
end

# Tests

def run_tests
  desc = 'one cake'
  actual = max_duffel_bag_value([[2, 1]], 9)
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'two cakes'
  actual = max_duffel_bag_value([[4, 4], [5, 5]], 9)
  expected = 9
  assert_equal(actual, expected, desc)

  desc = 'only take less valuable cake'
  actual = max_duffel_bag_value([[4, 4], [5, 5]], 12)
  expected = 12
  assert_equal(actual, expected, desc)

  desc = 'lots of cakes'
  actual = max_duffel_bag_value([[2, 3], [3, 6], [5, 1], [6, 1], [7, 1], [8, 1]], 7)
  expected = 12
  assert_equal(actual, expected, desc)

  desc = 'value to weight ratio is not optimal'
  actual = max_duffel_bag_value([[51, 52], [50, 50]], 100)
  expected = 100
  assert_equal(actual, expected, desc)

  desc = 'zero capacity'
  actual = max_duffel_bag_value([[1, 2]], 0)
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'cake with zero value and weight'
  actual = max_duffel_bag_value([[0, 0], [2, 1]], 7)
  expected = 3
  assert_equal(actual, expected, desc)

  desc = 'cake with non zero value and zero weight'
  actual = max_duffel_bag_value([[0, 5]], 5)
  expected = Float::INFINITY
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
