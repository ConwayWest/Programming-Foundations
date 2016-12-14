puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f

tip = (bill * (tip_percentage / 100))
bill_total = bill + tip

puts "The tip is $#{sprintf("%#.2f",tip)}"
puts "The total is $#{sprintf("%#.2f", bill_total)}"
