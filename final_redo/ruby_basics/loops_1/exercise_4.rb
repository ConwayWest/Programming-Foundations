loop do
  puts 'Should I stop looping?'
  answer = gets.chomp

  break if answer == 'yes'
  puts 'Remember to break out of loop answer "yes".'
end
