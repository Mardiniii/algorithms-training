# O(n2) approach
# def get_max_profit(stock_prices)
#   max_profit = 0
#
#   stock_prices.each.with_index do |price, index|
#     from = index + 1
#
#     stock_prices[from..-1].each do |sell_price|
#       profit = sell_price - price
#
#       if profit > max_profit
#         max_profit = profit
#       end
#     end
#   end
#
#   max_profit
# end

# O(n) approach
def get_max_profit(stock_prices)
  if stock_prices.length < 2
    raise "Getting a profit requires at least two prices."
  end

  min_price = stock_prices.first
  max_profit = stock_prices[1] - stock_prices[0]

  stock_prices[1..-1].each do |price|
    potential_profit = price - min_price

    max_profit = [max_profit, potential_profit].max

    min_price = [min_price, price].min
  end

  max_profit
end

# Tests

def run_tests
  desc = 'price goes up then down'
  actual = get_max_profit([1, 5, 3, 2])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'price goes down then up'
  actual = get_max_profit([7, 2, 8, 9])
  expected = 7
  assert_equal(actual, expected, desc)

  desc = 'price goes up all day'
  actual = get_max_profit([1, 6, 7, 9])
  expected = 8
  assert_equal(actual, expected, desc)

  desc = 'price goes down all day'
  actual = get_max_profit([9, 7, 4, 1])
  expected = -2
  assert_equal(actual, expected, desc)

  desc = 'price stays the same all day'
  actual = get_max_profit([1, 1, 1, 1])
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'error with empty prices'
  assert_raises(desc) {
    get_max_profit([])
  }

  desc = 'error with one price'
  assert_raises(desc) {
    get_max_profit([1])
  }
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
