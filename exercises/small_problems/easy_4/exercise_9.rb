require 'pry'

DIGITS = {
  1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'
}.freeze

def integer_to_string(number)
  tens = number.size - 1
  binding.pry
  digit = ''

  while tens >= 0
    digit << DIGITS[number / (10**tens)]
    number = number % (10**tens)
    tens -= 1
  end
  digit
end

# p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'
