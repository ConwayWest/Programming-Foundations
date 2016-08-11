answer = nil

loop do
  puts ">> How many lines do you want? Enter a number >= 3: (Q to quit)"
  answer = gets.chomp

  if answer.to_i >= 3
    answer.to_i.times do
      puts "Launch School is the best!"
    end
  elsif answer.downcase == 'q'
    break
  else
    puts ">> That's not enough lines."
  end
end

puts ">> Goodbye!"
