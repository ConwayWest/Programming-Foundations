puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

year = Time.now.year
retirement_gap = retirement_age - age
retirement_year = year + retirement_gap

puts "It's #{year}. You will retire in #{retirement_year}."
puts "You have only #{retirement_gap} years of work to go!"
