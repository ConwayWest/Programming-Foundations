say_hello = true
iterator = 1

while say_hello
  puts 'Hello!'

  say_hello = false if iterator == 5
  iterator += 1
end
