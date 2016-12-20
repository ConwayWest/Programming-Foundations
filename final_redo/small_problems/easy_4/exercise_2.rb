require 'pry'

def century(integer)
  return '1st' if integer / 100 == 0
  if integer / 100 && integer % 100 == 0
    (integer / 100).to_s + suffix(integer / 100)
  else
    ((integer / 100) + 1).to_s + suffix((integer / 100) + 1)
  end
end

def suffix(integer)
  suffix_hash = { 0 => 'th', 1 => 'st', 2 => 'nd', 3 => 'rd',
                  4 => 'th', 5 => 'th', 6 => 'th', 7 => 'th',
                  8 => 'th', 9 => 'th', 10 => 'th', 11 => 'th',
                  12 => 'th', 13 => 'th', 14 => 'th', 15 => 'th',
                  16 => 'th', 17 => 'th', 18 => 'th', 19 => 'th'
                }
  integer_array = integer.to_s.chars.map(&:to_i)

  if ((integer % 100) / 10) != 1
    suffix_hash[integer_array.last]
  else
    suffix_hash[integer_array.last(2).join.to_i]
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'


# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end