def balanced?(tree_root)
  return true unless tree_root

  depths = []

  nodes = []
  nodes << [tree_root, 0]

  until nodes.empty?
    node, depth = nodes.pop

    # Case: We found a leaf
    if !node.left && !node.right
      unless depths.include?(depth)
        depths.push(depth)

        if depths.length > 2 ||
            depths.length == 2 && (depths[0] - depths[1]).abs > 1
          return false
        end
      end
    # Case: This is not a leaf
    else
      nodes.push([node.left, depth + 1]) if node.left
      nodes.push([node.right, depth + 1]) if node.right
    end
  end

  true
end

# Tests

class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
  end
end

def run_tests
  desc = 'full tree'
  tree = BinaryTreeNode.new(5)
  left = tree.insert_left(8)
  right = tree.insert_right(6)
  left.insert_left(1)
  left.insert_right(2)
  right.insert_left(3)
  right.insert_right(4)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'both leaves at the same depth'
  tree = BinaryTreeNode.new(3)
  left = tree.insert_left(4)
  right = tree.insert_right(2)
  left.insert_left(1)
  right.insert_right(9)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'leaf heights differ by one'
  tree = BinaryTreeNode.new(6)
  left = tree.insert_left(1)
  right = tree.insert_right(0)
  right.insert_right(7)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'leaf heights differ by two'
  tree = BinaryTreeNode.new(6)
  left = tree.insert_left(1)
  right = tree.insert_right(0)
  right_right = right.insert_right(7)
  right_right.insert_right(8)
  result = balanced?(tree)
  assert_false(result, desc)

  desc = 'three leaves total'
  tree = BinaryTreeNode.new(1)
  left = tree.insert_left(5)
  right = tree.insert_right(9)
  right.insert_left(8)
  right.insert_right(5)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'both subtrees superbalanced'
  tree = BinaryTreeNode.new(1)
  left = tree.insert_left(5)
  right = tree.insert_right(9)
  right_left = right.insert_left(8)
  right.insert_right(5)
  right_left.insert_left(7)
  result = balanced?(tree)
  assert_false(result, desc)

  desc = 'both subtrees superbalanced two'
  tree = BinaryTreeNode.new(1)
  left = tree.insert_left(2)
  right = tree.insert_right(4)
  left.insert_left(3)
  left_right = left.insert_right(7)
  left_right.insert_right(8)
  right_right = right.insert_right(5)
  right_right_right = right_right.insert_right(6)
  right_right_right.insert_right(9)
  result = balanced?(tree)
  assert_false(result, desc)

  desc = 'only one node'
  tree = BinaryTreeNode.new(1)
  result = balanced?(tree)
  assert_true(result, desc)

  desc = 'linked list tree'
  tree = BinaryTreeNode.new(1)
  right = tree.insert_right(2)
  right_right = right.insert_right(3)
  right_right.insert_right(4)
  result = balanced?(tree)
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
