placement = ['1st', '2nd', '3rd', '4th', '5th', 'last']
solicited_array = []
last = 0

placement.each do |x|
  puts "==> Enter the #{x} number:"
  solicited_array << gets.chomp.to_i
  last = solicited_array.pop if x == 'last'
end

if solicited_array.include?(last)
  puts "The number #{last} appears in #{solicited_array}."
else
  puts "The number #{last} does not appear in #{solicited_array}."
end
