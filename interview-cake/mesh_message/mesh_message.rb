def get_path(graph, start_node, end_node)
  unless graph.key?(start_node)
    raise ArgumentError, "Start node not in graph."
  end

  unless graph.key?(end_node)
    raise ArgumentError, "End node not in graph."
  end

  # Use a queue instead of an array to have real O(1) inserts and removes
  nodes_to_visit = Queue.new
  nodes_to_visit << start_node

  how_we_reached_nodes = { start_node => nil }

  until nodes_to_visit.empty?
    current_node = nodes_to_visit.pop
    puts current_node

    if current_node == end_node
      return reconstruct_path(how_we_reached_nodes, start_node, end_node)
    end

    graph[current_node].each do |neighbor|
      next if how_we_reached_nodes.key?(neighbor)
      nodes_to_visit << neighbor
      how_we_reached_nodes[neighbor] = current_node
    end
  end

  nil
end

def reconstruct_path(how_we_reached_nodes, start_node, end_node)
  puts how_we_reached_nodes.inspect
  reversed_shortest_path = []

  current_node = end_node

  while current_node
    reversed_shortest_path << current_node
    current_node = how_we_reached_nodes[current_node]
  end

  reversed_shortest_path.reverse!
end

# Tests

def run_tests
  @graph = {
    a: [:b, :c, :d],
    b: [:a, :d],
    c: [:a, :e],
    d: [:a, :b],
    e: [:c],
    f: [:g],
    g: [:f],
  }

  desc = 'two hop path 1'
  actual = get_path(@graph, :a, :e)
  expected = [:a, :c, :e]
  assert_equal(actual, expected, desc)

  desc = 'two hop path 2'
  actual = get_path(@graph, :d, :c)
  expected = [:d, :a, :c]
  assert_equal(actual, expected, desc)

  desc = 'one hop path 1'
  actual = get_path(@graph, :a, :c)
  expected = [:a, :c]
  assert_equal(actual, expected, desc)

  desc = 'one hop path 2'
  actual = get_path(@graph, :f, :g)
  expected = [:f, :g]
  assert_equal(actual, expected, desc)

  desc = 'one hop path 3'
  actual = get_path(@graph, :g, :f)
  expected = [:g, :f]
  assert_equal(actual, expected, desc)

  desc = 'zero hop path'
  actual = get_path(@graph, :a, :a)
  expected = [:a]
  assert_equal(actual, expected, desc)

  desc = 'no path'
  actual = get_path(@graph, :a, :f)
  expected = nil
  assert_equal(actual, expected, desc)

  desc = 'start node not present'
  assert_raises(desc) { get_path(@graph, :h, :a) }

  desc = 'end node not present'
  assert_raises(desc) { get_path(@graph, :a, :h) }
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
