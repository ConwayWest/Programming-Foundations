def digit_list(number)
  list_of_digits = []
  string_array = number.to_s.split('')

  string_array.each do |x|
    list_of_digits << x.to_i
  end
  
  list_of_digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
