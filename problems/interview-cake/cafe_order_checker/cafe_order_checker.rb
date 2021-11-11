def first_come_first_served?(take_out, dine_in, served_orders)
  take_out_index = 0
  dine_in_index = 0

  take_out_max_index = take_out.length - 1
  dine_in_max_index = dine_in.length - 1

  served_orders.each do |order|
    if take_out_index <= take_out_max_index && order == take_out[take_out_index]
      take_out_index += 1
    elsif dine_in_index <= dine_in_max_index && order == dine_in[dine_in_index]
      dine_in_index += 1
    else
      return false
    end
  end

  true
end

# Tests

def run_tests
  desc = 'both registers have same number of orders'
  result = first_come_first_served?([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6])
  assert_true(result, desc)

  desc = 'registers have different lengths'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 2, 6, 3, 5])
  assert_false(result, desc)

  desc = 'one register is empty'
  result = first_come_first_served?([], [2, 3, 6], [2, 3, 6])
  assert_true(result, desc)

  desc = 'served orders is missing orders'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 6, 3, 5])
  assert_false(result, desc)

  desc = 'served orders has extra orders'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8])
  assert_false(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
