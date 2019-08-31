require 'set'

# Time complexity: O(n)
# Space complexity: O(n)
# def contains_cycle?(first_node)
#   seen_nodes = Set.new
#   node = first_node
#   has_cycle = false
#
#   # Check if the linked list contains a cycle.
#   while node
#     if seen_nodes.include?(node)
#       has_cycle = true
#       break
#     else
#       seen_nodes.add(node)
#     end
#
#     node = node.next
#   end
#
#   has_cycle
# end

# Time complexity: O(n)
# Space complexity: O(1)
# My solution
# def contains_cycle?(first_node)
#   # return false unless first_node.next
#
#   has_cycle = false
#   slow_runner = first_node
#   fast_runner = first_node
#   first_round = true
#
#   while fast_runner
#     if slow_runner == fast_runner && !first_round
#       has_cycle = true
#       break
#     end
#
#     first_round = false
#     fast_runner = fast_runner.next ? fast_runner.next.next : nil
#     slow_runner = slow_runner.next
#   end
#
#   has_cycle
# end

# Time complexity: O(n)
# Space complexity: O(1)
# Solution
def contains_cycle?(first_node)
  slow_runner = first_node
  fast_runner = first_node

  while fast_runner && fast_runner.next
    slow_runner = slow_runner.next
    fast_runner = fast_runner.next.next

    return true if slow_runner == fast_runner
  end

  false
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
  desc = 'linked list with no cycle'
  fourth = LinkedListNode.new(4)
  third = LinkedListNode.new(3, fourth)
  second = LinkedListNode.new(2, third)
  first = LinkedListNode.new(1, second)
  result = contains_cycle?(first)
  assert_false(result, desc)

  desc = 'cycle loops to beginning'
  fourth = LinkedListNode.new(4)
  third = LinkedListNode.new(3, fourth)
  second = LinkedListNode.new(2, third)
  first = LinkedListNode.new(1, second)
  fourth.next = first
  result = contains_cycle?(first)
  assert_true(result, desc)

  desc = 'cycle loops to middle'
  fifth = LinkedListNode.new(5)
  fourth = LinkedListNode.new(4, fifth)
  third = LinkedListNode.new(3, fourth)
  second = LinkedListNode.new(2, third)
  first = LinkedListNode.new(1, second)
  fifth.next = third
  result = contains_cycle?(first)
  assert_true(result, desc)

  desc = 'two node cycle at end'
  fifth = LinkedListNode.new(5)
  fourth = LinkedListNode.new(4, fifth)
  third = LinkedListNode.new(3, fourth)
  second = LinkedListNode.new(2, third)
  first = LinkedListNode.new(1, second)
  fifth.next = fourth
  result = contains_cycle?(first)
  assert_true(result, desc)

  desc = 'empty list'
  result = contains_cycle?(nil)
  assert_false(result, desc)

  desc = 'one element linked list no cycle'
  first = LinkedListNode.new(1)
  result = contains_cycle?(first)
  assert_false(result, desc)

  desc = 'one element linked list cycle'
  first = LinkedListNode.new(1)
  first.next = first
  result = contains_cycle?(first)
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
