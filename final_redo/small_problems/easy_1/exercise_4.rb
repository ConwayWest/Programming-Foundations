def count_occurrences(array)
  count_hash = {}

  array.uniq.each do |x|
    count_hash[x] = array.count(x)
  end

  count_hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)