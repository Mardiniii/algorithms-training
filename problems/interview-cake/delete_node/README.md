**Delete a node from a singly-linked list, given only a variable pointing to that node.**

The input could, for example, be the variable b below:

```ruby
class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

a = LinkedListNode.new('A')
b = LinkedListNode.new('B')
c = LinkedListNode.new('C')

a.next = b
b.next = c

delete_node(b)
```
