user_array = []
final_string = ""

puts "Please enter a statement: "
user_input = gets.chomp
user_array = user_input.split(' ')

user_array.each do |x|
  final_string << x.capitalize << " "
end
final_string.rstrip!
p final_string

#ORRRRR THIS MUCH BETTER WAY

puts "Let's try that again (but better): "
words = gets.chomp

p words.split.map { |word| word.capitalize }.join(' ')