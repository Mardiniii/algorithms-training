def reverse_words!(message)
  reverse_chars!(message, 0, message.length - 1)

  start_index = 0

  for i in 0..message.length
    if message[i] == ' ' || i == message.length
      reverse_chars!(message, start_index, i - 1)

      start_index = i + 1
    end
  end

  message
end

def reverse_chars!(string, left_index, right_index)
  while left_index < right_index
    temp = string[right_index]

    string[right_index] = string[left_index]
    string[left_index] = temp

    left_index += 1
    right_index -= 1
  end
end

# Tests

def run_tests
  desc = 'one word'
  message = 'vault'
  reverse_words!(message)
  expected = 'vault'
  assert_equal(message, expected, desc)

  desc = 'two words'
  message = 'thief cake'
  reverse_words!(message)
  expected = 'cake thief'
  assert_equal(message, expected, desc)

  desc = 'three words'
  message = 'one another get'
  reverse_words!(message)
  expected = 'get another one'
  assert_equal(message, expected, desc)

  desc = 'multiple words same length'
  message = 'rat the ate cat the'
  reverse_words!(message)
  expected = 'the cat ate the rat'
  assert_equal(message, expected, desc)

  desc = 'multiple words different lengths'
  message = 'yummy is cake bundt chocolate'
  reverse_words!(message)
  expected = 'chocolate bundt cake is yummy'
  assert_equal(message, expected, desc)

  desc = 'empty string'
  message = ''
  reverse_words!(message)
  expected = ''
  assert_equal(message, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
