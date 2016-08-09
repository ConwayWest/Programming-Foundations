puts ">> Do you want me to print something? (y/n)"
answer = gets.chomp

loop do
  if answer.downcase == 'y'
    print "something"
    break
  elsif answer.downcase == 'n'
    break
  else
    puts ">> Invalid input! Please enter y or n"
    puts ">> Do you want me to print something? (y/n)"
    answer = gets.chomp
  end
end

#LAUNCH SCHOOL ANSWER
# choice = nil
# loop do
#   puts '>> Do you want me to print something? (y/n)'
#   choice = gets.chomp.downcase
#   break if %w(y n).include?(choice)
#   puts '>> Invalid input! Please enter y or n'
# end
# puts 'something' if choice == 'y'