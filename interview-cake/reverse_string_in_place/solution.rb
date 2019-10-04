def reverse!(string)
  left = 0
  right = string.length - 1

  while left < right
    temp = string[left]

    string[left] = string[right]
    string[right] = temp

    left += 1
    right -= 1
  end  
end

# Tests

def run_tests
  desc = 'empty string'
  string = ''
  reverse!(string)
  expected = ''
  assert_equal(string, expected, desc)

  desc = 'single character string'
  string = 'A'
  reverse!(string)
  expected = 'A'
  assert_equal(string, expected, desc)

  desc = 'longer string'
  string = 'ABCDE'
  reverse!(string)
  expected = 'EDCBA'
  assert_equal(string, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
