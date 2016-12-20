require 'pry'

def running_total(array)
  sum_array = []

  array.each do |x|
    if array.index(x) == 0
      sum_array << x
    else
      sum = x + sum_array[array.index(x) - 1]
      sum_array << sum
    end
  end

  sum_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end