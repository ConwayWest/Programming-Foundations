munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
male_total = 0

munsters.each_value do |value|
  if value["gender"] == "male"
    male_total += value["age"]
  end
end

p male_total
