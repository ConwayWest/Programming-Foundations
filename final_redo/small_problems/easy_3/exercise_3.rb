puts 'Please write word or multiple words:'
user_input = gets.chomp

char_count = user_input.delete(' ').size
puts "There are #{char_count} characters in \"#{user_input}\"."
