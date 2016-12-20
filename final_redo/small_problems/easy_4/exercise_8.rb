require 'pry'

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(signed_string)
  sign = ''
  if signed_string[0] == '+' || signed_string[0] == '-'
    sign = signed_string[0]
    signed_string = signed_string[1..-1]
  end
  final_string = string_to_integer(signed_string)
  final_string = 0 - final_string if sign == '-'
  final_string
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
