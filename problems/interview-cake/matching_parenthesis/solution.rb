# My solution

def get_closing_paren(sentence, opening_paren_index)
  stack = []

  sentence[opening_paren_index..-1].chars.each_with_index do |char, index|
    next if char != "(" && char != ")"

    stack.push(char) if char == "("
    stack.pop if char == ")"
    return index + opening_paren_index if stack.empty?
  end

  raise "There are missing parenthesis!"
end

# Suggested solution

def get_closing_paren(sentence, opening_paren_index)
  open_nested_parens = 0

  (opening_paren_index + 1).upto(sentence.length - 1) do |position|
    char = sentence[position]

    if char == '('
      open_nested_parens += 1
    elsif char == ')'
      if open_nested_parens == 0
        return position
      else
        open_nested_parens -= 1
      end
    end
  end

  raise 'No closing parenthesis :('
end

# Tests

def run_tests
  desc = 'all openers then closers'
  actual = get_closing_paren('((((()))))', 2)
  expected = 7
  assert_equal(actual, expected, desc)

  desc = 'mixed openers and closers'
  actual = get_closing_paren('()()((()()))', 5)
  expected = 10
  assert_equal(actual, expected, desc)

  desc = 'no matching closer'
  assert_raises(desc) { get_closing_paren('()(()', 2) }
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
