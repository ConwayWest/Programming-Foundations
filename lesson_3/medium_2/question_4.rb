sentence = "Humpty Dumpty sat on a wall."
array = sentence.split(/\W/)
array.reverse!
final_sentence = array.join(' ') + '.'
puts final_sentence
