def reverse_words(string)
  words = string.split(' ')

  words.each do |x|
    if x.size > 4
      x.reverse!
    end
  end

  words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
