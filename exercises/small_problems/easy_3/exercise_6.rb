# def xor?(one, two)
#   array = []
#   array << one
#   array << two

#   if array.count(true) == 1
#     true
#   else
#     false
#   end
# end

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
