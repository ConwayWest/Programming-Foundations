puts ">> Do you want me to print something? (y/n)"
answer = gets.chomp

print "something" if answer.downcase == 'y'
