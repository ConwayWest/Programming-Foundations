flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#flintstones.select { |x|
#  if x.start_with?("Be")
#    p flintstones.index(x)
#  end
#}

p flintstones.index { |name| name[0, 2] == "Be" }
