# LeetCode problem: https://leetcode.com/problems/single-row-keyboard/

# @param {String} keyboard
# @param {String} word
# @return {Integer}
def calculate_time(keyboard, word)
  time = 0
  index_by_key = {}

  keyboard.chars.each_with_index do |char, index|
    index_by_key[char] = index
  end

  current_position = 0

  word.chars.each do |char|
    next_index = index_by_key[char]

    time += (next_index - current_position).abs
    current_position = next_index
  end

  time
end
