def running_total(array)
  # new_array = []
  # total = 0

  # array.each do |x|
  #   total += x
  #   new_array << total
  # end
  # new_array

  # Launch School way
  # sum = 0
  # array.map { |value| sum += value }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
