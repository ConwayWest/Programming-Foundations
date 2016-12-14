def stringy(integer, start = 1)
  binary_string = []

  integer.times do |index|
    number = index.even? ? 1 : 0 if start == 1
    number = index.even? ? 0 : 1 if start == 0
    binary_string << number
  end

  binary_string.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
