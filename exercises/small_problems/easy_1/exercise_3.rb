def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

p digit_list(12345) == [1, 2, 3, 4, 5]
