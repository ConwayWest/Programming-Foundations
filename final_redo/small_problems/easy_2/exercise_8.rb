def prompt(msg)
  puts ">> #{msg}"
end

prompt 'Please enter an integer greater than 0:'
number = gets.chomp.to_i
prompt "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp

iterator = number
if choice.downcase.start_with?('s')
  sum = 0
  while iterator > 0
    sum += iterator
    iterator -= 1
  end
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif choice.downcase.start_with?('p')
  product = 1
  while iterator > 0
    product *= iterator
    iterator -= 1
  end
  puts "The product of the integers between 1 and #{number} is #{product}."
end
  
