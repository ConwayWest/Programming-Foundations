def real_palindrome?(collection)
  alphanum_range = (0...36).map { |alpha| alpha.to_s 36 }
  low_case_collection = collection.downcase

  low_case_collection.each_char do |x|
    low_case_collection.delete!(x) unless alphanum_range.include?(x)
  end

  low_case_collection == low_case_collection.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true
p real_palindrome?("madam i'm adam") == true
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
