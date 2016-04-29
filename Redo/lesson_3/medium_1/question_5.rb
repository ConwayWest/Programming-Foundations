def factors(number)
  dividend = number
  divisors = []
    while dividend > 0 do
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end
  divisors
end

puts "Please enter positive integer: "
answer = gets.chomp.to_i

p factors(answer)
