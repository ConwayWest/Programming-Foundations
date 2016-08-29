def multisum(number)
  sum = 0

  (1..number).each do |x|
    sum += x if (x % 3 == 0 || x % 5 == 0)
  end
  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
