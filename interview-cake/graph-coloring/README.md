**Given an undirected graph with maximum degree DD, find a graph coloring using at most D+1D+1 colors.**

Graphs are represented by an array of NN node objects, each with a label, a set of neighbors, and a color:

```ruby
require 'set'

class GraphNode
  attr_accessor :label, :neighbors, :color

  def initialize(label)
    @label = label
    @neighbors = Set.new
    @color = nil
  end
end

a = GraphNode.new("a")
b = GraphNode.new("b")
c = GraphNode.new("c")

a.neighbors << b
b.neighbors << a
b.neighbors << c
c.neighbors << b

graph = [a, b, c]
```
