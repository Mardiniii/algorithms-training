# This is a demo task.

# Write a function:

# def solution(a)

# that, given an array A of N integers, returns the smallest positive
# integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Assume that:

# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].
# Complexity:

# expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(N), beyond input storage
# (not counting the storage required for input arguments).

def solution(a)
  length = a.length
  ocurrences = Array.new(length + 1, false)

  a.each_with_index do |element, index|
    next unless element > 0 && element <= length

    ocurrences[element - 1] = true
  end

  ocurrences.each_with_index do |element, index|
    return index + 1 if element == false
  end

  return length + 1
end
