number = 42

case number
when 10..100
  puts "Yep!"
else
  puts "Nope!"
end

puts (10..100).cover?(number)