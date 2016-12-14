def average(num_array)
  total = num_array.inject(:+)
  (total / num_array.size).to_f
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40