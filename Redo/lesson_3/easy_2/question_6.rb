ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

min_age = ages["Herman"]

ages.each_value do |v|
  if v < min_age
    min_age = v
  end
end

p min_age
