require 'pry'

def reverse_words(string)
  reverse_array = []

  string.split.each do |word|
    word.reverse! if word.size > 5
    reverse_array << word
  end
  
  reverse_array.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
