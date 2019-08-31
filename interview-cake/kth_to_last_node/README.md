**You have a linked list and want to find the kkth to last node.**

Write a method kth_to_last_node() that takes an integer kk and the head_node of a singly-linked list, and returns the kkth to last node in the list.

For example:

```ruby
class LinkedListNode
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

a = LinkedListNode.new("Angel Food")
b = LinkedListNode.new("Bundt")
c = LinkedListNode.new("Cheese")
d = LinkedListNode.new("Devil's Food")
e = LinkedListNode.new("Eccles")

a.next = b
b.next = c
c.next = d
d.next = e

kth_to_last_node(2, a)
# Returns the node with value "Devil's Food" (the 2nd to last node).
```
