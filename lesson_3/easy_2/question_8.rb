flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


flintstones.each {|x| 
  if x.start_with?("Be") 
    puts flintstones.index(x) 
    break
  end
}

puts flintstones.index { |name| name[0, 2] == "Be" }
