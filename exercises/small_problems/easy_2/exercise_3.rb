puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percent = (gets.chomp.to_f / 100)

tip = bill * tip_percent
total = bill + tip

puts "The tip is $#{sprintf("%0.2f",tip.round(2))}"
puts "The total is $#{sprintf("%0.2f",total.round(2))}"
