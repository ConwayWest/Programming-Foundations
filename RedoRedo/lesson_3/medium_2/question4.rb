sentence = "Humpty Dumpty sat on a wall."

backwards_sentence = sentence.split(/\W/).reverse.join(" ") + "."

p sentence
p backwards_sentence
