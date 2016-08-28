def oddities(array)
  new_array = []
  array.each do |x|
    new_array << x if array.index(x).even?
  end
  new_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc','def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
