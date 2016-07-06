munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value do |v|
  if v["age"] >= 0
    case v["age"]
    when 0..17
      v["age_group"] = "kid"
    when 18..64
      v["age_group"] = "adult"
    else
      v["age_group"] = "senior"
    end
  end
end

p munsters
