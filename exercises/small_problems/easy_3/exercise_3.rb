print "Please write a word or multiple words: "
answer = gets.chomp
size = answer.delete(" ").size
puts "There are #{size} characters in \"#{answer}\""
