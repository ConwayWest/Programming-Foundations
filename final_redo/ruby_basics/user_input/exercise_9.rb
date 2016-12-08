number_of_lines = nil
user_input = nil

loop do
  loop do
    puts '>> How many output lines do you want? Enter a number >= 3: (Q to quit)'

    user_input = gets.chomp
    exit if user_input.downcase == 'q'

    number_of_lines = user_input.to_i
    break if number_of_lines.to_i >= 3

    puts ">> That's not enough lines."
  end

  while number_of_lines > 0
    puts 'Launch School is the best!'
    number_of_lines -= 1
  end
end
