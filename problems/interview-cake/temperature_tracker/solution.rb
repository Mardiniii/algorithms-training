class TempTracker

  def initialize
    # For mode
    @ocurrences = Array.new(111, 0)
    @max_ocurrences = 0
    @mode = nil

    # For mean
    @total_sum = 0.0
    @number_of_readings = 0

    # For min and max
    @max_temp = nil
    @min_temp = nil
  end

  # Implement methods to track the max, min, mean, and mode.
  def insert(temperature)
    # Update mode
    @ocurrences[temperature] += 1
    if @ocurrences[temperature] > @max_ocurrences
      @mode = temperature
      @max_ocurrences = @ocurrences[temperature]
    end

    # Update mean
    @number_of_readings += 1
    @total_sum += temperature
    @mean = @total_sum / @number_of_readings

    # Update max and min
    @max_temp = temperature if @max_temp.nil? || temperature > @max_temp
    @min_temp = temperature if @min_temp.nil? || temperature < @min_temp
  end

  def get_max
    @max_temp
  end

  def get_min
    @min_temp
  end

  def get_mean
    @mean
  end

  def get_mode
    @mode
  end
end

# Tests

def run_tests
  tracker = TempTracker.new

  tracker.insert(50)
  msg = 'on first temp recorded'
  assert_equal(tracker.get_max, 50, "max #{msg}")
  assert_equal(tracker.get_min, 50, "min #{msg}")
  assert_equal(tracker.get_mean, 50.0, "mean #{msg}")
  assert_equal(tracker.get_mode, 50, "mode #{msg}")

  tracker.insert(80)
  msg = 'on higher temp recorded'
  assert_equal(tracker.get_max, 80, "max #{msg}")
  assert_equal(tracker.get_min, 50, "min #{msg}")
  assert_equal(tracker.get_mean, 65.0, "mean #{msg}")
  assert_in(tracker.get_mode, [50, 80], "mode #{msg}")

  tracker.insert(80)
  msg = 'on third temp recorded'
  assert_equal(tracker.get_max, 80, "max #{msg}")
  assert_equal(tracker.get_min, 50, "min #{msg}")
  assert_equal(tracker.get_mean, 70.0, "mean #{msg}")
  assert_equal(tracker.get_mode, 80, "mode #{msg}")

  tracker.insert(30)
  msg = 'on lower temp recorded'
  assert_equal(tracker.get_max, 80, "max #{msg}")
  assert_equal(tracker.get_min, 30, "min #{msg}")
  assert_equal(tracker.get_mean, 60.0, "mean #{msg}")
  assert_equal(tracker.get_mode, 80, "mode #{msg}")
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

def assert_in(a, bs, desc)
  puts "#{desc} ... #{bs.include?(a) ? 'PASS' : "FAIL: #{a.inspect} not in #{bs.inspect}"}"
end

run_tests
