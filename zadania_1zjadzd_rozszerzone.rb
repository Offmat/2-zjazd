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






#czytanie z plików

# contents = File.read("/etc/hosts")
# puts contents

def longest_line(file_name)
  file = File.open(file_name)
  longest = ""
  file.each do |line|
    longest = line if line.length > longest.length
  end
  file.close
  longest
end


# "./code\ sensei/kurs\ stacjonarny/zadania_2/testowy.txt"
# "~/code\ sensei/kurs\ stacjonarny/zadania_2/testowy.txt"
#"/home/mateusz/code\ sensei/kurs\ stacjonarny/zadania_2/testowy.txt"
#czemu to nie działa z pliku a z terminala działa? jak się odwoływać do adresów bezwzględnych z pliku? zwłaszcza, że do hosts działa też od "/" i adres. Mam problem ze strukturą systemu chyba trochę - jakieś pomocne linki, materiały?


puts longest_line("/etc/hosts")
puts longest_line("testowy.txt")  #na szczęście są jeszcze adresy względne

data = File.open("testowy.txt") {  |line| line.reverse } #skąd tu się wzięły dodatkowe /n przed każdą linią?!
data.each {|l| puts l.inspect}
