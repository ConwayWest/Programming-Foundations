numbers = []

while numbers.size < 5
  numbers.push((0..99).to_a.sample)
end

puts numbers
