def sum_function(array)
  return 0 if array.empty?  

  array[0] + sum_function(array[1..-1])
end
