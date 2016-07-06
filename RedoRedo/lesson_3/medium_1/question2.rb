array = []
hash = {}
statement = "The Flintstones Rock"

statement.delete! " "
statement.each_char { |x| array.push(x) }

array.each do |letter|
  hash[letter] = array.count(letter)
end

p hash
