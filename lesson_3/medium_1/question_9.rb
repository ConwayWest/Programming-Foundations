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
        a = {"age_group" => "kid"}
        munsters[key] = munsters[key].merge(a)
      when 18..64
        a = {"age_group" => "adult"}
        munsters[key] = munsters[key].merge(a)
      else
        a = {"age_group" => "senior"}
        munsters[key] = munsters[key].merge(a)
      end
    end
  end
end
p munsters
