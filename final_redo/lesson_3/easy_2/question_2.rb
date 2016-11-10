ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age_total = 0

ages.each_value do |value|
  age_total += value
end

p age_total

p ages.values.inject(:+)
