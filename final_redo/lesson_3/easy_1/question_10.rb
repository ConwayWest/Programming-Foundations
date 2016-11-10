flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flinstones_hash = {}

flintstones.each_with_index do |x, i|
  flinstones_hash[x] = i
end

p flinstones_hash
