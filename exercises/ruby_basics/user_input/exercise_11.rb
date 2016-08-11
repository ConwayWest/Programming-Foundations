require 'pry'

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def positive_and_negative(number_string)
  if number_string.to_i > 0
    "positive"
  elsif number_string.to_i < 0
    "negative"
  end
end

requirements = { "positive" => 0, "negative" => 0}
first_int = nil
second_int = nil

puts ">> Welcome! Please enter 1 positive and 1 negative integer in any order."
puts ""

loop do
  loop do 
    puts ">> Please enter your first integer:"
    first_int = gets.chomp
    break if valid_number?(first_int)
    puts ">> Invalid number, please try again."
  end

  loop do
    puts ">> Please enter your second integer:"
    second_int = gets.chomp
    break if valid_number?(second_int)
    puts ">> Invalid number, please try again."
  end
  requirements[positive_and_negative(first_int)] += 1
  requirements[positive_and_negative(second_int)] += 1
  break if requirements["positive"] == 1 && requirements["negative"] == 1

  requirements = { "positive" => 0, "negative" => 0}
  puts ">> Need both one positive and one negative integer. Please try again."
end

result = first_int.to_i + second_int.to_i

puts "#{first_int} + #{second_int} = #{result}"
