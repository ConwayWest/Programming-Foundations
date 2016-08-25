def count_occurences(array)
  hash = {}
  
  array.uniq.each do |x|
    hash[x] = array.count(x)
  end

  hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcyle', 'motorcyle', 'car', 'truck']

count_occurences(vehicles)
