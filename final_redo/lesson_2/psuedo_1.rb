def add_two_numbers(num1, num2)
  num1 + num2
end

puts "First Number?"
number1 = gets.chomp.to_f

puts "Second Number?"
number2 = gets.chomp.to_f

puts add_two_numbers(number1, number2)
