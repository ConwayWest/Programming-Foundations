statement = "Yo whaddup holmes it be me Kyle aka the skill dog aka your worst nightmare yo"
array = statement.split(" ")
modified_statement = ""

#mine
array.each do |x|
  if array.last == x
    modified_statement << x.capitalize
  else
    modified_statement << x.capitalize + " "
  end
end

p modified_statement

#launch schools
p statement.split.map { |word| word.capitalize }.join(' ')
