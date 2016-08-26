puts "Please enter a name:"
name = gets.chomp

name = "Teddy" if name.empty? == true

puts "#{name} is #{rand(20..200)} years old!"
