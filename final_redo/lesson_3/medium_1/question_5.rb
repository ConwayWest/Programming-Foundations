def factors(number)
  dividend = number
  divisors = []
  while number > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1

    break if dividend == 0
  end
  divisors
end
