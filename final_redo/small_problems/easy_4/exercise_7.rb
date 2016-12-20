require 'pry'

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  string_array = string.chars
  num_array = []

  string_array.each do |x|
    num_array << DIGITS[x]
  end

  array_to_integer(num_array)
end

def array_to_integer(array)
  power = array.size - 1
  final_integer = 0

  array.each do |x|
    final_integer += (x * (10**power))
    power -= 1
  end
  final_integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
