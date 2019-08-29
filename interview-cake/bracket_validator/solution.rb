require 'set'

# Time complexity equals to O(n)
# Space complexity equals to O(n) since in the worst case all the characters are
# opener and we'll push all of them to the stack. 
def valid?(code)
  stack = []
  closers_by_openers = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
  }

  openers = closers_by_openers.keys.to_set
  closers = closers_by_openers.values.to_set

  code.chars do |char|
    if openers.include?(char)
      stack.push(char)
    elsif closers.include?(char)
      if stack.empty?
        return false
      else
        last_opener_added = stack.pop

        if closers_by_openers[last_opener_added] != char
          return false
        end
      end
    end
  end

  stack.empty?
end

# Tests

def run_tests
  desc = 'valid short code'
  result = valid?('()')
  assert_true(result, desc)

  desc = 'valid longer code'
  result = valid?('([]{[]})[]{{}()}')
  assert_true(result, desc)

  desc = 'interleaved openers and closers'
  result = valid?('([)]')
  assert_false(result, desc)

  desc = 'mismatched opener and closer'
  result = valid?('([][]}')
  assert_false(result, desc)

  desc = 'missing closer'
  result = valid?('[[]()')
  assert_false(result, desc)

  desc = 'extra closer'
  result = valid?('[[]]())')
  assert_false(result, desc)

  desc = 'empty string'
  result = valid?('')
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
