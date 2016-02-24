munsters = {
  "Herman" => {"age" => 32, "gender" => "male"},
  "Lily" => {"age" => 30, "gender" => "female"},
  "Grandpa" => {"age" => 402, "gender" => "male"},
  "Eddie" => {"age" => 10, "gender" => "male"},
  "Marilyn" => {"age" => 23, "gender" => "female"}
}

p munsters["Herman"]["age"]

munsters.each do |key, item|
  munsters[key].each do |key2, item2|
    if key2 == "age"
      case item2
      when 0..17
        munsters[key]["age_group"] = "kid"
      when 18..64
        munsters[key]["age_group"] = "adult"
      when item >= 65
        munsters[key]["age_group"] = "senior"
      end
    end
  end
end
p munsters["Herman"]