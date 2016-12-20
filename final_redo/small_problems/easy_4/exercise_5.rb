def multisum(integer)
  multiple_array = []
  (1..integer).each do |x|
    multiple_array << x if (x % 3 == 0) || (x % 5 == 0)
  end
  multiple_array.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
