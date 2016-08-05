loop do 
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer.downcase.start_with?('y')
end
