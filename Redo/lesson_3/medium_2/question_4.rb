sentence = "Humpty Dumpty sat on a wall."

array = sentence.split(' ')
array.each { |word| word.reverse! }
backwards_sentence = array.join(" ")

p sentence
p backwards_sentence
