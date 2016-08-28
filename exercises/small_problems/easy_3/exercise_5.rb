def multiply(num1, num2)
  num1 * num2
end

def square(number)
  multiply(number, number)
end

p square(5) == 25
p square(-8) == 64

# Further Exploration
# def power(n, power)
#   result = 1
#   (power / 2).times {result *= multiply(n, n)}
#   result *= n if power.odd?
#   result
# end
