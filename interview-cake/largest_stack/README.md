**You want to be able to access the largest element in a stack.**

You've already implemented this Stack class:

```ruby
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
  # If the stack is empty, returns nil. (It would also be
  # reasonable to throw an exception.)
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
```

Use your Stack class to **implement a new class MaxStack with a method get_max() that returns the largest element in the stack**. get_max() should not remove the item.

Your stacks will contain only integers.
