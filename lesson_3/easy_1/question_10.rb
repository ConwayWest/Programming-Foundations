flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

new_flintstones = Hash[flintstones.each_with_index.map { |value, index| [value, index]}]

p new_flintstones

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

p flintstones_hash