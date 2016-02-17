statement = "The Flintstones Rock"

statement_array = statement.scan(/./)

statement_hash = {}

statement_array.each do |x|
  statement_hash[x] = statement_array.count(x)
end

p statement_hash
