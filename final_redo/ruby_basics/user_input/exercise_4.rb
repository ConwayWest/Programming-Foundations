possible_answers = ['y', 'n']
answer = ''

loop do
  puts ">> Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase

  break if possible_answers.include?(answer)
  puts ">> Invalid input! Please enter y or n"
end

puts "something" if answer == 'y'
