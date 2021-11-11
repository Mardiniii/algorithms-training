# Recursive approach
# Time complexity => O(2^n)

def fib(n)
  if n < 0
    raise ArgumentError, "You should pass 0 or possitive integer as input."
  end

  # Base case
  if n <= 1
    n
  # Recursive case
  else
    fib(n-2) + fib(n-1)
  end
end

# Memoized approach
# Avoids re-computing values several times
class Fibber
  def initialize
    @fibs = { 0 => 0, 1 => 1}
  end

  def fib(n)
    if n < 0
      raise ArgumentError, "You should pass 0 or possitive integer as input."
    end

    if n <= 1
      @fibs[n]
    elsif @fibs.key?(n)
      @fibs[n]
    else
      @fibs[n] = fib(n-2) + fib(n-1)
    end
  end
end

def fib(n)
  Fibber.new.fib(n)
end

# Using a bottom-up approach
# Time complexity => O(n)
# Space complexity => O(1)

def fib(n)
  if n < 0
    raise ArgumentError, "You should pass 0 or possitive integer as input."
  elsif n <= 1
    n
  else
    prev_prev = 0
    prev = 1

    (n - 1).times do
      prev_prev, prev = prev, prev + prev_prev
    end

    prev
  end
end

# Tests

def run_tests
  desc = 'zeroth fibonacci'
  actual = fib(0)
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'first fibonacci'
  actual = fib(1)
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'second fibonacci'
  actual = fib(2)
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'third fibonacci'
  actual = fib(3)
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'fifth fibonacci'
  actual = fib(5)
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'tenth fibonacci'
  actual = fib(10)
  expected = 55
  assert_equal(actual, expected, desc)

  desc = 'negative fibonacci'
  assert_raises(desc) { fib(-1) }
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
