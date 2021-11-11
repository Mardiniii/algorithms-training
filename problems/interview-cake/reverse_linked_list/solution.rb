def reverse(head_of_list)
  return nil unless head_of_list
  return head_of_list unless head_of_list.next

  # Reverse the linked list in place.
  previous_node = nil
  current_node = head_of_list

  while current_node
    # Store the current node's next node
    next_node = current_node.next
    # Update the current node's next node
    current_node.next = previous_node

    # Update pointers
    previous_node = current_node
    current_node = next_node
  end

  previous_node
end

# Tests

class LinkedListNode
  attr_accessor :value, :next

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end

  def values
    vs = []

    node = self
    while node
      vs << node.value
      node = node.next
    end

    vs
  end
end

def run_tests
  desc = 'short linked list'
  second = LinkedListNode.new(2)
  first = LinkedListNode.new(1, second)

  result = reverse(first)
  assert_not_nil(result, desc)

  actual = result.values
  expected = [2, 1]
  assert_equal(actual, expected, desc)

  desc = 'long linked list'
  sixth = LinkedListNode.new(6)
  fifth = LinkedListNode.new(5, sixth)
  fourth = LinkedListNode.new(4, fifth)
  third = LinkedListNode.new(3, fourth)
  second = LinkedListNode.new(2, third)
  first = LinkedListNode.new(1, second)

  result = reverse(first)
  assert_not_nil(result, desc)

  actual = result.values
  expected = [6, 5, 4, 3, 2, 1]
  assert_equal(actual, expected, desc)

  desc = 'one element linked list'
  first = LinkedListNode.new(1)

  result = reverse(first)
  assert_not_nil(result, desc)

  actual = result.values
  expected = [1]
  assert_equal(actual, expected, desc)

  desc = 'empty linked list'
  result = reverse(nil)
  assert_nil(result, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

def assert_nil(value, desc)
  puts "#{desc} ... #{value.nil? ? 'PASS' : "FAIL: #{value} is not nil"}"
end

def assert_not_nil(value, desc)
  puts "#{desc} ... #{value.nil? ? "FAIL: #{value} is nil" : 'PASS'}"
end

run_tests
