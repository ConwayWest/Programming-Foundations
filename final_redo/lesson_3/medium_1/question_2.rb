statement = "The Flintstones Rock"
statement_hash = {}

statement.delete(" ").each_char { |char| statement_hash[char] = statement.count(char) }

p statement_hash
