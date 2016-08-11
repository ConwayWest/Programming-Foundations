def time_of_day(daylight)
  if daylight == true
    puts "It's daytime!"
  elsif daylight == false
    puts "It's nighttime!"
  end
end

daylight = [true, false].sample
time_of_day(daylight)
