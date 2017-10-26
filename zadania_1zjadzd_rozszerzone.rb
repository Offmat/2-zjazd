require "pry"

# # Wygeneruj 100-elementową tablicę losowych liczb z zakresu od 0 do 99. Następnie korzystając z
# # metody Array#group_by , stwórz hash, gdzie kluczem będzie reszta z dzielenia elementu przez
# # 10.
#
# array = Array.new(100) {rand(100)}
#
# puts array.inspect
#
# grouped = array.group_by {|e| e%10}
#
# puts grouped    #w dokumentacji hash był wyświetlony z kluczami w kolejności #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}, ale zakładam, że tak sobie tylko napisali bo hash nie ma kolejności, a tak na prawdę wypisuje się jak u mnie - w kolejności w której trafia na nowe klucze. Przynajmniej poznałem hash.sort.
#
# lengths = grouped.transform_values {|v| v.length}
# binding.pry
# puts lengths


# ćwiczenia z rescue

# def blad
#   a=8/0
#   puts "bleble"
#   a=15
#   puts a
#   puts "olałeś to?"
# end
#
# begin
#   b
#   blad
# rescue ZeroDivisionError
#   puts "to się nie uda"
# end
