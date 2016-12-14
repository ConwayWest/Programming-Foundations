puts 'What is your name?'
name = gets.chomp

if name.chars.last != '!'
  puts "Hello #{name}."
else
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
end
