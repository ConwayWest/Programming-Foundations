SQMETERS_TO_SQFEET = 10.7639.freeze

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area = length * width
area_ft = area * SQMETERS_TO_SQFEET
puts "The are of the room is #{area.round(2)} square meters (#{area_ft.round(2)} square feet.)"
