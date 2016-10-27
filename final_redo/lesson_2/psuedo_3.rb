INT_ARRAY = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def every_other_int(array)
  new_array = []
  array.each do |x|
    if array.index(x).even?
      new_array << x
    end
  end
  new_array
end

p every_other_int(INT_ARRAY)
