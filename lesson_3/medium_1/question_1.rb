spaces = 0

10.times do |x|
  x = "The Flintstones Rock!"
  puts  (" " * spaces) + x
  spaces += 1
end

10.times { |x| puts (" " * x) + "The Flintstones Rock!" }
