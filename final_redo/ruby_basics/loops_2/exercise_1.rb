count = 1
even_or_odd = ''

loop do
  count.odd? ? even_or_odd = 'odd' : even_or_odd = 'even'
  puts "#{count} is #{even_or_odd}!"

  break if count == 5
  count += 1
end
