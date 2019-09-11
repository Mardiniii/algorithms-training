def find_rectangular_overlap(rect1, rect2)
  return rect1 if rect1 == rect2
  return rect2 if is_inside?(rect1, rect2)
  return rect1 if is_inside?(rect2, rect1)

  if is_overlaped?(rect1, rect2)
    overlapped_rectangle(rect1, rect2)
  elsif is_overlaped?(rect2, rect1)
    overlapped_rectangle(rect2, rect1)
  else
    build_rectangle
  end
end

def is_inside?(outter, inner)
  horizontally_contained = inner[:left_x] > outter[:left_x] && inner[:left_x] + inner[:width] < outter[:left_x] + outter[:width]
  vertically_contained = inner[:bottom_y] > outter[:bottom_y] && inner[:bottom_y] + inner[:height] < outter[:bottom_y] + outter[:height]

  return true if horizontally_contained && vertically_contained

  false
end

def is_overlaped?(rect1, rect2)
  x_axis_intersection = rect2[:left_x] > rect1[:left_x] && rect2[:left_x] < rect1[:left_x] + rect1[:width]
  y_axis_intersection = rect2[:bottom_y] > rect1[:bottom_y] && rect2[:bottom_y] < rect1[:bottom_y] + rect1[:height]

  x_axis_intersection && y_axis_intersection
end

def build_rectangle(left_x = nil, bottom_y = nil, width = nil, height = nil)
  {
    left_x: left_x,
    bottom_y: bottom_y,
    width: width,
    height: height
  }
end

def overlapped_rectangle(rect1, rect2)
  width = rect1[:left_x] + rect1[:width] - rect2[:left_x]
  height = rect1[:bottom_y] + rect1[:height] - rect2[:bottom_y]

  build_rectangle(rect2[:left_x], rect2[:bottom_y], width, height)
end

# Tests

def run_tests
  rect1 = {
    left_x: 1,
    bottom_y: 1,
    width: 6,
    height: 3
  }
  rect2 = {
    left_x: 5,
    bottom_y: 2,
    width: 3,
    height: 6
  }
  expected = {
    left_x: 5,
    bottom_y: 2,
    width: 2,
    height: 2
  }
  actual = find_rectangular_overlap(rect1, rect2)
  assert_equal(actual, expected, 'overlap along both axes')

  rect1 = {
    left_x: 1,
    bottom_y: 1,
    width: 6,
    height: 6
  }
  rect2 = {
    left_x: 3,
    bottom_y: 3,
    width: 2,
    height: 2
  }
  expected = {
    left_x: 3,
    bottom_y: 3,
    width: 2,
    height: 2
  }
  actual = find_rectangular_overlap(rect1, rect2)
  assert_equal(actual, expected, 'one rectangle inside another')

  rect1 = {
    left_x: 2,
    bottom_y: 2,
    width: 4,
    height: 4
  }
  rect2 = {
    left_x: 2,
    bottom_y: 2,
    width: 4,
    height: 4
  }
  expected = {
    left_x: 2,
    bottom_y: 2,
    width: 4,
    height: 4
  }
  actual = find_rectangular_overlap(rect1, rect2)
  assert_equal(actual, expected, 'both rectangles the same')

  rect1 = {
    left_x: 1,
    bottom_y: 2,
    width: 3,
    height: 4
  }
  rect2 = {
    left_x: 2,
    bottom_y: 6,
    width: 2,
    height: 2
  }
  expected = {
    left_x: nil,
    bottom_y: nil,
    width: nil,
    height: nil
  }
  actual = find_rectangular_overlap(rect1, rect2)
  assert_equal(actual, expected, 'touch on horizontal edge')

  rect1 = {
    left_x: 1,
    bottom_y: 2,
    width: 3,
    height: 4
  }
  rect2 = {
    left_x: 4,
    bottom_y: 3,
    width: 2,
    height: 2
  }
  expected = {
    left_x: nil,
    bottom_y: nil,
    width: nil,
    height: nil
  }
  actual = find_rectangular_overlap(rect1, rect2)
  assert_equal(actual, expected, 'touch on vertical edge')

  rect1 = {
    left_x: 1,
    bottom_y: 1,
    width: 2,
    height: 2
  }
  rect2 = {
    left_x: 3,
    bottom_y: 3,
    width: 2,
    height: 2
  }
  expected = {
    left_x: nil,
    bottom_y: nil,
    width: nil,
    height: nil
  }
  actual = find_rectangular_overlap(rect1, rect2)
  assert_equal(actual, expected, 'touch at a corner')

  rect1 = {
    left_x: 1,
    bottom_y: 1,
    width: 2,
    height: 2
  }
  rect2 = {
    left_x: 4,
    bottom_y: 6,
    width: 3,
    height: 6
  }
  expected = {
    left_x: nil,
    bottom_y: nil,
    width: nil,
    height: nil
  }
  actual = find_rectangular_overlap(rect1, rect2)
  assert_equal(actual, expected, 'no overlap')
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
