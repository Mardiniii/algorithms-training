class WordCloudData
  attr_reader :words_to_counts

  def initialize(input_string)
    @words_to_counts = {}

    populate_words_to_counts(input_string)
  end

  private

    def populate_words_to_counts(input_string)
      current_word_start_index = 0
      current_word_length = 0

      input_string.each_char.with_index do |character, index|
        # if we reached the end of the string we check if the last
        # character is a letter and add the last word to our hash
        if index == input_string.length - 1
          if is_letter?(character)
            current_word_length += 1
          end

          if current_word_length > 0
            current_word = input_string.slice(current_word_start_index, current_word_length)
            add_word_to_hash(current_word)
          end
        # if we reach a space or emdash we know we're at the end of a word
        # so we add it to our hash and reset our current word
        elsif character == ' ' || character == "\u2014"
          if current_word_length > 0
            current_word = input_string.slice(current_word_start_index, current_word_length)
            add_word_to_hash(current_word)
            current_word_length = 0
          end
        # we want to make sure we split on ellipses so if we get two periods in
        # a row we add the current word to our hash and reset our current word
        elsif character == '.'
          if index < input_string.length - 1 && input_string[index + 1] == '.'
            if current_word_length > 0
              current_word = input_string.slice(current_word_start_index,current_word_length)
              add_word_to_hash(current_word)
              current_word_length = 0
            end
          end
        # if the character is a letter or an apostrophe, we add it to our current word
        elsif is_letter?(character) || character == '\''
          if current_word_length == 0
            current_word_start_index = index
          end

          current_word_length += 1
        # if the character is a hyphen, we want to check if it's surrounded by letters
        # if it is, we add it to our current word
        elsif character == '-'
          if index > 0 && is_letter?(input_string[index - 1]) && is_letter?(input_string[index + 1])
            if current_word_length == 0
              current_word_start_index = index
            end
            current_word_length += 1
          else
            if current_word_length > 0
              current_word = input_string.slice(current_word_start_index, current_word_length)
              add_word_to_hash(current_word)
              current_word_length = 0
            end
          end
        end
      end
    end

    def add_word_to_hash(word)
      if words_to_counts.key?(word)
        @words_to_counts[word] += 1
      elsif words_to_counts.key?(word.downcase)
        @words_to_counts[word.downcase] += 1
      elsif words_to_counts.key?(word.capitalize)
        @words_to_counts[word.downcase] = 1
        @words_to_counts[word.downcase] += @words_to_counts[word.capitalize]
        @words_to_counts.delete(word.capitalize)
      else
        @words_to_counts[word] = 1
      end
    end

    def is_letter?(character)
      characters = ('a'..'z').to_a + ('A'..'Z').to_a

      return characters.include? character
    end
end

# Tests

def run_tests
  desc = 'simple sentence'
  input = 'I like cake'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'I' => 1, 'like' => 1, 'cake' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'longer sentence'
  input = 'Chocolate cake for dinner and pound cake for dessert'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {
    'and' => 1,
    'pound' => 1,
    'for' => 2,
    'dessert' => 1,
    'Chocolate' => 1,
    'dinner' => 1,
    'cake' => 2,
  }
  assert_equal(actual, expected, desc)

  desc = 'punctuation'
  input = 'Strawberry short cake? Yum!'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'cake' => 1, 'Strawberry' => 1, 'short' => 1, 'Yum' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'hyphenated words'
  input = 'Dessert - mille-feuille cake'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'cake' => 1, 'Dessert' => 1, 'mille-feuille' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'ellipses between words'
  input = 'Mmm...mmm...decisions...decisions'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'mmm' => 2, 'decisions' => 2 }
  assert_equal(actual, expected, desc)

  desc = 'apostrophes'
  input = "Allie's Bakery: Sasha's Cakes"

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'Bakery' => 1, 'Cakes' => 1, "Allie's" => 1, "Sasha's" => 1 }
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
