require 'set'

class GraphNode
  attr_accessor :label, :neighbors, :color

  def initialize(label)
    @label = label
    @neighbors = Set.new
    @color = nil
  end
end

def color_graph(graph, colors)

  # Create a valid coloring for the graph.
  graph.each do |node|
    raise "The graph has a loop" if node.neighbors.include?(node)

    # Colors as a set so we can check if the color is illegal in constant time.
    illegal_colors = node.neighbors.map(&:color).compact.to_set

    node.color = colors.find { |color| !illegal_colors.include?(color) }
  end

  true
end

# Tests

def run_tests
  colors = %w[red green blue orange yellow white]

  desc = 'line graph'
  node_a = GraphNode.new('a')
  node_b = GraphNode.new('b')
  node_c = GraphNode.new('c')
  node_d = GraphNode.new('d')

  node_a.neighbors << node_b
  node_b.neighbors << node_a
  node_b.neighbors << node_c
  node_c.neighbors << node_b
  node_c.neighbors << node_d
  node_d.neighbors << node_c

  graph = [node_a, node_b, node_c, node_d]
  tampered_colors = colors.dup
  color_graph(graph, tampered_colors)
  assert_graph_coloring(graph, colors)

  desc = 'separate graph'
  node_a = GraphNode.new('a')
  node_b = GraphNode.new('b')
  node_c = GraphNode.new('c')
  node_d = GraphNode.new('d')

  node_a.neighbors << node_b
  node_b.neighbors << node_a
  node_c.neighbors << node_d
  node_d.neighbors << node_c

  graph = [node_a, node_b, node_c, node_d]
  tampered_colors = colors.dup
  color_graph(graph, tampered_colors)
  assert_graph_coloring(graph, colors)

  desc = 'triangle graph'
  node_a = GraphNode.new('a')
  node_b = GraphNode.new('b')
  node_c = GraphNode.new('c')

  node_a.neighbors << node_b
  node_a.neighbors << node_c
  node_b.neighbors << node_a
  node_b.neighbors << node_c
  node_c.neighbors << node_a
  node_c.neighbors << node_b

  graph = [node_a, node_b, node_c]
  tampered_colors = colors.dup
  color_graph(graph, tampered_colors)
  assert_graph_coloring(graph, colors)

  desc = 'envelope graph'
  node_a = GraphNode.new('a')
  node_b = GraphNode.new('b')
  node_c = GraphNode.new('c')
  node_d = GraphNode.new('d')
  node_e = GraphNode.new('e')

  node_a.neighbors << node_b
  node_a.neighbors << node_c
  node_b.neighbors << node_a
  node_b.neighbors << node_c
  node_b.neighbors << node_d
  node_b.neighbors << node_e
  node_c.neighbors << node_a
  node_c.neighbors << node_b
  node_c.neighbors << node_d
  node_c.neighbors << node_e
  node_d.neighbors << node_b
  node_d.neighbors << node_c
  node_d.neighbors << node_e
  node_e.neighbors << node_b
  node_e.neighbors << node_c
  node_e.neighbors << node_d

  graph = [node_a, node_b, node_c, node_d, node_e]
  tampered_colors = colors.dup
  color_graph(graph, tampered_colors)
  assert_graph_coloring(graph, colors)

  desc = 'loop graph'
  node_a = GraphNode.new('a')

  node_a.neighbors << node_a

  graph = [node_a]
  tampered_colors = colors.dup
  assert_raises(desc) { color_graph(graph, tampered_colors) }
end

def assert_graph_coloring(graph, colors)
  assert_graph_has_colors(graph, colors)
  assert_graph_color_limit(graph)
  graph.each(&method(:assert_node_unique_color))
end

def assert_graph_has_colors(graph, colors)
  graph.each do |node|
    msg = "Node #{node.label} color"
    assert_in(node.color, colors, msg)
  end
end

def assert_graph_color_limit(graph)
  max_degree, colors_found =
    graph.reduce([0, Set.new]) do |(current_degree, colors), node|
      [[node.neighbors.size, current_degree].max, colors + [node.color]]
    end
  max_colors = max_degree + 1
  used_colors = colors_found.size
  msg = "Used #{used_colors} colors and expected #{max_colors} at most"
  assert_less_equal(used_colors, max_colors, msg)
end

def assert_node_unique_color(node)
  node.neighbors.each do |neighbor|
    msg = "Adjacent nodes #{node.label} and #{neighbor.label} have the same color #{node.color}"
    assert_not_equal(node.color, neighbor.color, msg)
  end
end

def assert_in(a, bs, desc)
  puts "#{desc} ... #{bs.include?(a) ? 'PASS' : "FAIL: #{a.inspect} not in #{bs.inspect}"}"
end

def assert_less_equal(a, b, desc)
  puts "#{desc} ... #{a <= b ? 'PASS' : 'FAIL'}"
end

def assert_not_equal(a, b, desc)
  puts "#{desc} ... #{a != b ? 'PASS' : 'FAIL'}"
end

def assert_raises(desc)
  yield
  puts "#{desc} ... FAIL"
rescue
  puts "#{desc} ... PASS"
end

run_tests
