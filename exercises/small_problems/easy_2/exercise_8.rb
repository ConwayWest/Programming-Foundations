def prompt(msg)
  puts "=> #{msg}"
end

def add(integer)
  (1..integer).reduce(:+)
end

def multiply(integer)
  (1..integer).reduce(:*)
end

number = 0
while number <= 0
  prompt "Please enter an integer greater than 0:"
  number = gets.chomp.to_i
  break if number > 0
  prompt "ERROR: INCORRECT VALUE: PLEASE TRY AGAIN"
end

prompt "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp

if choice.downcase.start_with?('s')
  result = add(number)
  puts "The sum of integers between 1 and #{number} is #{result}."
elsif choice.downcase.start_with?('p')
  result = multiply(number)
  puts "The product of integers between 1 and #{number} is #{result}."
else
  prompt "ERROR: UNKNOWN OPERATION"
end
