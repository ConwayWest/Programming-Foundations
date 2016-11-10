munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
total_male_age = 0

munsters.each_value do |value|
  total_male_age += value['age'] if value['gender'] == 'male'
end

p total_male_age
