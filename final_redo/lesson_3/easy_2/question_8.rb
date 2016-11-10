flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.each do |x|
#   if x.start_with?("Be")
#     flintstones.index(x)
#   end
# end

p flintstones.index { |name| name.start_with?("Be") }
