statement = "The Flintstones Rock"
letter_hash = {}

letter_array = statement.split(//)
letter_array.delete(" ")
p letter_array

letter_array.each do |letters|
  letter_hash[letters] = letter_array.count(letters)
end

p letter_hash
