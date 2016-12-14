puts 'What is your age?'
age = gets.chomp.to_i
puts 'At what age would you like to retire?'
retire_age = gets.chomp.to_i

age_delta = retire_age - age
current_year = Time.now.year
retire_year = current_year + age_delta

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{age_delta} years of work to go!"
