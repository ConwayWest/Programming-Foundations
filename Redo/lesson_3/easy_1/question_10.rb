flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}

flintstones.each_with_index do |k, v|
  flintstones_hash[k] = v
end

p flintstones_hash
