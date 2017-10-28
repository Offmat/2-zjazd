# Napisz skrypt hasher.rb , który wypisuje taki hash dla pliku, którego nazwa jest podana jako
# pierwszy argument skryptu.
# Jeżeli podano 0 lub więcej niż jeden argument, skrypt powinien wypisać: “Usage: ./hasher.rb
# filename”
require "digest"

# if ARGV.length == 1
#   puts Digest::MD5.file(ARGV[0]).hexdigest
# else
#   puts "“Usage: ./hasher.rb filename”"
# end

# Zmodyfikuj skrypt tak, by opcjonalnie pobierał również drugi argument. Jeżeli zostanie on
# podany, zamiast wypisywania hasha MD5, powinna zostać wypisana informacja, czy wyliczony
# hash jest równy temu podanemu jako drugi argument skryptu.
# W przypadku podania jednego argumentu, zachowanie nie zmienia się.
# W przypadku podania zera albo więcej niż dwóch argumentów, skrypt powinien wypisać: “Usage:
# ./hasher.rb filename [hash]”


# if ARGV.length == 1
#   puts Digest::MD5.file(ARGV[0]).hexdigest
# elsif ARGV.length == 2
#   if (Digest::MD5.file(ARGV[0]).hexdigest) == ARGV[1]
#     puts "Given hash is same with the file"
#   else
#     puts "Given hash is different from the file"
#   end
# else
#   puts "“Usage: ./hasher.rb filename [hash]”"
# end

def hash_md5
  Digest::MD5.file(ARGV[0]).hexdigest
rescue
  "Couldn't calculate hash for file: #{ARGV[0]}"
end

puts hash_md5
