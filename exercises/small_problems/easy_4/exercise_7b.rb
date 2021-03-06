HEXA_DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
  '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}.freeze

def hexadecimal_to_integer(hexadecimal)
  sum = 0
  digits = hexadecimal.chars.map { |char| HEXA_DIGITS[char.upcase] }

  size = digits.size - 1
  digits.each do |value|
    sum += (value * 16**size)
    size -= 1
  end
  sum
end

p hexadecimal_to_integer('4D9f') == 19871
