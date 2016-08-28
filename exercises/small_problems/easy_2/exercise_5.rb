print "What is your name? "
name = gets.chomp

if name.end_with?('!')
  name.delete!('!')
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
