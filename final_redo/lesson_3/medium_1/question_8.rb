def titleize(string)
  capitalized_string = ""
  string.split(' ').each do |x|
    capitalized_string << x.capitalize + " "
  end
  capitalized_string.rstrip!
end

words = "the flintstones rock"
p titleize(words)

# words.split.map { |word| word.capitalize }.join(' ')
