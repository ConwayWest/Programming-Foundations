# (1..99).each do |x|
#   puts x if (x % 2) == 1
# end

(1..99).each do |x|
  puts x if x.odd?
end
