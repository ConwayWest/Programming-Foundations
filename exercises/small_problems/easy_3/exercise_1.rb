def prompt(msg)
  puts "==> #{msg}"
end

array = []

prompt "Enter the 1st number:"
array << gets.chomp.to_i
prompt "Enter the 2nd number:"
array << gets.chomp.to_i
prompt "Enter the 3rd number:"
array << gets.chomp.to_i
prompt "Enter the 4th number:"
array << gets.chomp.to_i
prompt "Enter the 5th number:"
array << gets.chomp.to_i
prompt "Enter the last number:"
last = gets.chomp.to_i

if array.include?(last)
  puts "The number #{last} appears in #{array}."
else
  puts "The number #{last} does not appear in #{array}."
end
