def stringy(size, default = 1)
  numbers = []

  size.times do |index|
    if default == 1
      number = index.even? ? 1 : 0
    else
      number = index.even? ? 1 : 0
    end
    numbers << number
  end
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'