flintstones_hash = {}
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_index {|name, index| 
  flintstones_hash[name] = index
}

p flintstones_hash
