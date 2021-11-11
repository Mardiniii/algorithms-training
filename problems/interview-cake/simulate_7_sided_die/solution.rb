def rand5
  rand(1..5)
end

def rand7
  loop do
    roll1 = rand5
    roll2 = rand5

    number = (roll1 - 1) * 5 + (roll2 - 1) + 1

    if number > 21
      next
    else
      break number % 7 + 1
    end
  end

end

puts 'Rolling 7-sided die...'
puts rand7.inspect
