flintstones = %w(Fred Barney wilma Betty BamBam Pebbles)

flintstones.map! { |x| x[0..2] }

p flintstones
