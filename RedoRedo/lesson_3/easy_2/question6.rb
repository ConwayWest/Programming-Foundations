ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#lowest_value = ages.values.first

#ages.each { |k, v| 
#  if v < lowest_value
#    lowest_value = v
#  end
#}

#p lowest_value

p ages.values.min
