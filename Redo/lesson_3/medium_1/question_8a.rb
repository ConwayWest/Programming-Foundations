puts "Please enter a sentence: "
words = gets.chomp

p words.split.map { |word| word.capitalize }.join(' ')

p words
