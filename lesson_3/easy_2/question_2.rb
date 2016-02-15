ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

tot_sum = 0
ages.each {|key, value| tot_sum += value }
puts tot_sum
