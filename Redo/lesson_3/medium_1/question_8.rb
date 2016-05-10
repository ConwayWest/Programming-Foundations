string = "hey how are you doing?"
array = string.split(' ')
string2 = ""

array.each do |x|
  x.capitalize!
  string2 += x + " "
end

string2.rstrip!
p string2
