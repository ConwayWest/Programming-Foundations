require 'pry'
def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  palindrome?(string.gsub(/\W+/, '').downcase)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true
p real_palindrome?("Madam, I'm Adam") == true
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
