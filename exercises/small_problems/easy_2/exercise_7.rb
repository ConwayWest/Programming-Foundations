# (1..99).each do |x|
#   puts x if (x % 2) == 0
# end

(1..99).each do |x|
  puts x if x.even?
end
