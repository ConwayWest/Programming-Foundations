munsters = {
  "Herman" => { "age" => 32, "gender" => "male"},
  "Lily" => { "age" => 30, "gender" => "female"},
  "Grandpa" => { "age" => 402, "gender" => "male"},
  "Eddie" => { "age" => 10, "gender" => "male"},
  "Marilyn" => { "age" => 23, "gender" => "femaile"}
}

munsters.each_value do |value|
  case 
  when value["age"] > 0 && value["age"] <= 17
    value["age_group"] = "kid"
  when value["age"] >= 18 && value["age"] <= 64
    value["age_group"] = "adult"
  when value["age"] >= 65
    value["age_group"] = "senior"
  end
end

munsters.each do |key, value|
  p key
  p value
end
