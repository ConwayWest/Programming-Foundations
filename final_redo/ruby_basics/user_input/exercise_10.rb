def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def one_postive_negative(first, second)
  count_positive = 1 if first.to_i > 0 || second.to_i > 0
  count_negative = 1 if first.to_i < 0 || second.to_i < 0

  count_positive == 1 && count_negative == 1 ? true : false
end

first = ''
second = ''
loop do
  loop do
    puts ">> Please enter a positive or negative integer:"
    first = gets.chomp

    break if valid_number?(first)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end

  loop do
    puts ">> Please enter a positive or negative integer:"
    second = gets.chomp

    break if valid_number?(second)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end

  break if one_postive_negative(first, second)
  puts ">> Sorry. One integer must be positive, one must be negative."
  puts ">> Please start over."
end

puts "#{first} + #{second} = #{first.to_i + second.to_i}"
