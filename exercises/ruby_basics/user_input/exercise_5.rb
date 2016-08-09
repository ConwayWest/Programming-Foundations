answer = nil

loop do
  puts ">> How many lines do you want? Enter a number >= 3:"
  answer = gets.chomp.to_i

  if answer >= 3
    answer.times do
      puts "Launch School is the best!"
    end
    break
  else
    puts ">> That's not enough lines."
  end
end
