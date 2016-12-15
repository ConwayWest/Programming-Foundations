def oddities(array)
  odd_array = []
  array.each do |x|
    odd_array << x if array.index(x).even?
  end
  odd_array
end

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
