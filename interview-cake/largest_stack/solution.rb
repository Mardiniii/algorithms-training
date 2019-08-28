# Given class
class Stack
  # Initializes an empty stack.
  def initialize
    @items = []
  end

  # Pushes a new item onto the stack.
  def push(item)
    @items << item
  end

  # Removes and returns the last item.
  #
  # If the stack is empty, returns nil.
  def pop
    if @items.empty?
      nil
    else
      @items.pop
    end
  end

  # Returns the last item without removing it.
  def peek
    if @items.empty?
      nil
    else
      @items[-1]
    end
  end
end

# It was my first approach but I found the time complexity is not O(1) because
# if we pop the max item we'll have to iterate over all the elements from the Stack
# in order to find the largest.
# class MaxStack < Stack
#   # Implement the push, pop, and get_max methods.
#   def initialize
#     super
#     @max = nil
#   end
#
#   def push(item)
#     super
#
#     if @max.nil?
#       @max = item
#     else
#       @max = [@max, item].max
#     end
#
#     item
#   end
#
#   def pop
#     element = super
#
#     return nil if element.nil?
#
#     if @items.size == 0
#       @max = nil
#     else
#       @max = @items.max
#     end
#
#     element
#   end
#
#   def get_max
#     @max
#   end
# end

# Secondary approach using to stacks an updating the max stack ahead-of-time.

class MaxStack
  def initialize
    @stack = Stack.new
    @max_stack = Stack.new
  end

  def push(number)
    @max_stack.push(number) if @max_stack.peek.nil? || number >= get_max
    @stack.push(number)

    @stack
  end

  def pop
    item = @stack.pop

    if @max_stack.peek == item
      @max_stack.pop
    end

    item
  end

  def get_max
    @max_stack.peek
  end
end

# Tests

def run_tests
  desc = 'stack usage'
  max_stack = MaxStack.new

  max_stack.push(5)

  actual = max_stack.get_max
  expected = 5
  assert_equal(actual, expected, desc)

  max_stack.push(4)
  max_stack.push(7)
  max_stack.push(7)
  max_stack.push(8)

  actual = max_stack.get_max
  expected = 8
  assert_equal(actual, expected, desc)

  actual = max_stack.pop
  expected = 8
  assert_equal(actual, expected, desc)

  actual = max_stack.get_max
  expected = 7
  assert_equal(actual, expected, desc)

  actual = max_stack.pop
  expected = 7
  assert_equal(actual, expected, desc)

  actual = max_stack.get_max
  expected = 7
  assert_equal(actual, expected, desc)

  actual = max_stack.pop
  expected = 7
  assert_equal(actual, expected, desc)

  actual = max_stack.get_max
  expected = 5
  assert_equal(actual, expected, desc)

  actual = max_stack.pop
  expected = 4
  assert_equal(actual, expected, desc)

  actual = max_stack.get_max
  expected = 5
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
