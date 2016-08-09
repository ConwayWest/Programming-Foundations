def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def not_zero?(number_string)
  number_string.to_i != 0
end

numberator = nil
loop do
  puts ">> Please enter the numerator:"
  numberator = gets.chomp
  break if valid_number?(numberator)
  puts ">> Invalid input. Only integers are allowed."
end

denominator = nil
loop do
  puts ">> Please enter the denominator:"
  denominator = gets.chomp
  
  break if valid_number?(denominator) && not_zero?(denominator)
  if valid_number?(denominator) == false
    puts ">> Invalid input. Only integers allowed."
  elsif not_zero?(denominator) == false
    puts ">> Invalid input. A denominator of 0 is not allowed."
  end
end

puts ">> #{numberator} / #{denominator} is #{numberator.to_i / denominator.to_i}"
