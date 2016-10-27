STRINGARRAY = ['rock', 'paper', 'scissors', 'spock', 'lizard']

def array_conc(array)
  string = ""
  array.each { |x| string << x }
  string
end

p array_conc(STRINGARRAY)
