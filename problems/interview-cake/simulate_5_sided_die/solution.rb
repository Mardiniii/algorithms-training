def rand7
  rand(1..7)
end

def rand5
  number = 7

  while number > 5
    number = rand7
  end

  number
end

puts 'Rolling 5-sided die...'
puts rand5.inspect
