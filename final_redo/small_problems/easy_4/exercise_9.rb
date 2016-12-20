DIGITS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(number)
  num_array = []
  final_string = ''
  num_array << number if number == 0

  while number > 0
    number, remainder = number.divmod(10)
    num_array.unshift(remainder)
  end

  string_array = num_array.map { |char| DIGITS[char] }

  string_array.each do |x|
    final_string << x
  end
  final_string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# def integer_to_string(number)
#   result = ''
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(DIGITS[remainder])
#     break if number == 0
#   end
#   result
# end