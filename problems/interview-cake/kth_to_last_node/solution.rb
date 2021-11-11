# First approach two passes
# Time complexity: O(n)
# Space complexity: O(1)
def kth_to_last_node(k, head)
  if k < 1
    raise "k should greater or equal to one"
  end

  list_length = 1
  current_node = head

  while current_node = current_node.next
    list_length += 1
  end

  raise "k greater than linked list's length" if k > list_length

  current_node = head

  (list_length - k).times do
    current_node = current_node.next
  end

  current_node
end

# Second approach using stick with k width
# Time complexity: O(n)
# Space complexity: O(1)
def kth_to_last_node(k, head)
  if k < 1
    raise "k should greater or equal to one"
  end

  left_node = head
  right_node = head

  (k - 1).times do

    unless right_node = right_node.next
      raise "k greater than linked list's length" if k > list_length
    end
  end

  while right_node = right_node.next
    left_node = left_node.next
  end

  left_node
end

# Tests

class LinkedListNode
  attr_accessor :value, :next

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

def run_tests
  fourth = LinkedListNode.new(4)
  third = LinkedListNode.new(3, fourth)
  second = LinkedListNode.new(2, third)
  first = LinkedListNode.new(1, second)

  desc = 'first to last node'
  actual = kth_to_last_node(1, first)
  expected = fourth
  assert_equal(actual, expected, desc)

  desc = 'second to last node'
  actual = kth_to_last_node(2, first)
  expected = third
  assert_equal(actual, expected, desc)

  desc = 'first node'
  actual = kth_to_last_node(4, first)
  expected = first
  assert_equal(actual, expected, desc)

  desc = 'k greater than linked list length'
  assert_raises(desc) { kth_to_last_node(5, first) }

  desc = 'k is zero'
  assert_raises(desc) { kth_to_last_node(0, first) }
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
