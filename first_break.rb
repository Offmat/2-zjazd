require "pry"
# Napisz metodę initials , która wypisuje inicjały osoby na podstawie jej pełnego imienia.
# Wszystkie znaki inicjałów powinny być pisane z dużej litery.

# def initials(string)
#   array = string.split
#   array.each {|word| print word[0].upcase}
#   puts
# end
#
# initials('Jan Kozlowski') #=> JK
# initials('Jan Krzysztof Rakoczy') #=> JKR
# initials('marcin nowak') #=> MN

# ---------------------------------------------------------------------------

# Napisz funkcję obliczającą ilość samogłosek w podanym ciągu znaków. Jako samogłoski
# uznajemy: a, e, i, o, u oraz y

# def vowel_count(string)
#   vowel = "aeiouy"
#   counter = 0
#   string.each_char {|char| counter += 1 if vowel.include?(char)}
#   puts counter
# end
#
# vowel_count("test") #=> 1
# vowel_count("foobar") #=> 3
# vowel_count("longer with space") #=> 5

# ---------------------------------------------------------------------------

# Napisz funkcję, która znajdzie i zwróci środkowy znak w stringu. Jeśli długość stringa
# jest liczbą parzystą zwróć dwa środkowe znaki.

# def middle(string)
#   if string.length%2 == 0
#     puts string[string.length/2-1, 2]
#   else
#     puts string[string.length/2]
#     end
# end
#
# middle("abc") #=> "b"
# middle("middle") #=> "dd"
# middle("tesTing") #=> "T"

# ---------------------------------------------------------------------------

# Napisz funckję, która przyjmie ciąg znaków reprezentujący sekwencję DNA i zwróci
# sekwencję komplementarną. Adenina (A) z Tyminą (T), a Cytozyna © z Guaniną

# def complementary_DNA(string)
#   string.gsub(/[ATCG]/, 'A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C')
# end
#
# puts complementary_DNA("ATTA") #=> "TAAT"
# puts complementary_DNA("CGGC") #=> "GCCG"
# puts complementary_DNA("ACGTTAGTTA") #=> "TGCAATCAAT"

# ---------------------------------------------------------------------------

# Napisz funkcję accum , która działa w następujący sposób:

# def accum(string)
#   result = []
#   string.each_char.with_index do |char, i|
#     # binding.pry
#     result << char*(i+1)
#   end
#   result.each {|s| s.capitalize!}
#   result.join("-")
# end
#
# puts accum("abcd") #=> "A-Bb-Ccc-Dddd"
# puts accum("RqaEzty") #=> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# puts accum("cwAt") #=> "C-Ww-Aaa-Tttt"

# ---------------------------------------------------------------------------

# Napisz funkcję, która jako argument przyjmie tablicę liczb i zwróci sumę wszystkich
# elementów poza wartością najwyższą i najniższą.

# def sum_array(array)
#   array.inject(:+) - array.min - array.max
# end
#
#
# puts sum_array([1, 2, 3, 4]) #=> 5
# puts sum_array([12, 4, 0, -8]) #=> 4
# puts sum_array([12, 4]) #=> 0
# puts sum_array([120, 7, 145, -10, -15]) #=> 117

# ---------------------------------------------------------------------------

# Napisz funkcję, która dla otrzymanej tablicy liczb całkowitych zwraca tablicę tych
# samych liczb, ale o przeciwnej wartości.

# def invert_array(array)   #najlepiej użyć mapa, ale nie wyem czy o to chodziło w zadaniu
#   array.map {|e| -e}
# end

# def invert_array(array)
#   new_array = []
#   array.each {|e| new_array << -e}
#   new_array
# end
#
# print invert_array([1, 2, 3, 4, 5]) #=> [-1, -2, -3, -4, -5]
# puts
# print invert_array([1, -2, 3, -4, 5]) #=> [-1, 2, -3, 4, -5]
# puts
# print invert_array([0]) #=> [0]
# puts

# ---------------------------------------------------------------------------

# Napisz funkcję, która jako argumenty przyjmuje dwie tablice i zwraca tablicę z
# elemantami wspólnymi podanych tablic.

# def common_elements(ar1, ar2) #chyba nie o to chodziło, więc zrobiłem drugie
#   ar1 & ar2
# end

# def common_elements(ar1, ar2)
#   new_array =[]
#   ar1.each {|e| new_array << e if ar2.include?(e)}
#   new_array
# end
#
# print common_elements([1, 2, 3, 4, 5], [4, 5, 6]) #=> [4, 5]
# puts
# print common_elements(['a', 'b', 'c', 'd'], ['c','d', 'e']) #=> ['c', 'd']
# puts
# print common_elements([14, 'apple', 1227, 'cat'], ['cat', 166, 541, 1227]) #=> ['cat', 1227]
# puts

# ---------------------------------------------------------------------------

# Napisz funkcję, która przyjmie dowolną liczbę tablic (o tej samej długości) i zwróci jedną
# tablicę składającą się z wartości średnich elementów na poszczególnych indeksach
# przyjętych tablic.

# def avg_array(*arrays)
#   new_array = Array.new(arrays[0].length, 0)
#   arrays.each  do |array|
#     array.each.with_index {|e, i| new_array[i] += e }
#     # binding.pry
#   end
#   new_array.map do |e|
#     if e%arrays.length == 0
#       e/arrays.length
#     else
#       e/(arrays.length.to_f)
#     end
#   end
# end
#
# print avg_array([1, 3, 5], [3, 5, 7]) #=> [2, 4, 6]
# puts
# print avg_array([1, 5, 3, 22], [12, 22, 13, 5], [5, 12, 24, 5], [14, 40, 5, 17]) #=> [8, 19.75, 11.25, 13.5]
# puts

# ---------------------------------------------------------------------------

# Napisz funkcję, ktora przyjmie liczbę całkowitą i pozamienia jej cyfry miejscami w taki
# sposób, aby utworzyć jak najwyższą liczbę.

# def highest_number(number)
#   arr = number.to_s.split('').map {|e| e.to_i}
#   highest = []
#   arr.length.times do
#     highest << arr.max
#     arr.delete_at(arr.index(arr.max))
#   end
#   highest.join.to_i
# end
#
# puts highest_number(132) #=> 321
# puts highest_number(1464) #=> 6441
# puts highest_number(165423) #=> 654321

# ---------------------------------------------------------------------------

# Napisz metodę, która dla podanego argument n znajdzie wszystkie liczby całkowite w
# przedziale od 0 do n, które są podzielne przez 3 lub 5 i zwróci sumę tych liczb.

# def multiples(n)
#   # binding.pry
#   (1..n).sum do |e|
#     if (e%3 != 0 && e%5 != 0)
#       e = 0
#     else
#       e
#     end
#   end
# end
#
# puts multiples(10) #=> 33
# puts multiples(20) #=> 98

# ---------------------------------------------------------------------------

# Zaimplementuj funkcję, która wypisze, który z graczy wygrywa w grze papier, kamień,
# nożyce. Funkcja powinna przyjmować dwa argumenty odpowiadające wyborom graczy i
# działać w następujący sposób:

# def rps(arg1, arg2)
#   if arg1 == arg2
#     puts "Remis"
#   else
#     case [arg1, arg2]           #trochę łopatologicznie, ale nie mam innego pomysłu
#     when ['scissors', 'paper']
#       puts "Gracz 1 wygrywa"
#     when ['paper', 'rock']
#       puts "Gracz 1 wygrywa"
#     when ['rock', 'scissors']
#       puts "Gracz 1 wygrywa"
#     else
#       puts "Gracz 2 wygrywa"
#     end
#   end
# end
#
# rps('scissors', 'paper') #=> 'Gracz 1 wygrywa'
# rps('rock', 'paper') #=> 'Gracz 2 wygrywa'
# rps('scissors', 'scissors') #=> 'Remis'

# ---------------------------------------------------------------------------

# Napisz funkcję, która jako argumenty przyjmie dwa stringi i zwróci ich odległość
# Hamminga. Jeśli podane stringi nie są tej samej długości niech zwróci nil .

# def hamming_distance(string1, string2)
#   return nil if string1.length != string2.length
#   ham = 0
#   (0...string1.length).each { |i| ham += 1 if string1[i]  != string2[i] }
#   ham
# end
#
#
# puts hamming_distance('1234', '1235') #=> 1
# puts hamming_distance('GAGCCT', 'CATCGT') #=> 3
# puts hamming_distance('1234', '12345') #=> nil
# puts hamming_distance('123', 'foobar') #=> nil

# ---------------------------------------------------------------------------

# Pangram to zdanie, w którym przynajmniej raz pojawia się każda litera alfabetu.
# Napisz metodę, która sprawdzi czy podany ciąg znaków jest pangramem dla języka
# polskiego.

# def pangram?(string)
#   signs = []
#   string.split('').each {|s| signs << s.downcase if !signs.include?(s.downcase) && /[[:alpha:]]/.match(s) }
#   print signs
#   signs.length == 32
# end
#
# puts pangram?('Dość błazeństw, żrą mój pęk luźnych fig') #=> true
# puts pangram?('Losowy ciąg znaków') #=> false

# ---------------------------------------------------------------------------

# Napisz funkcję, która dokona konwersji liczby w zapisie arabskim na liczbę w zapisie
# rzymskim.
# Funkcja powinna byc w stanie skonwertować liczby od 1 do 3000.

# def iteration(roman, ones, fives, tens, ar)   #jeszcze mi się nigdy tak przyjemnie kod nie skrócił. Po kroku zajmowało to z 50 linijek w pewnym momencie
#     roman << ones + tens if ar == 9
#     roman << fives if (4..8).include?(ar)
#     roman.insert(-2, ones) if ar == 4
#     (ar-5).times {roman << ones} if (6..8).include?(ar)
#     (ar).times {roman << ones} if ar < 4
#     roman
# end
#
#
# def to_roman(number)
#   roman = []
#   array = number.to_s.split('').reverse.map! {|e| e.to_i}
#   iteration(roman, "M", "nope", "nope", array[3]) if array[3]
#   iteration(roman, "C", "D", "M", array[2]) if array[2]
#   iteration(roman, "X", "L", "D", array[1]) if array[1]
#   iteration(roman, "I", "V", "X", array[0]) if array[0]
#   roman.join
# end
#
# puts to_roman(5) #=> 'V'
# puts to_roman(37) #=> 'XXXVII'
# puts to_roman(924) #=> 'CMXXIV'
# puts to_roman(3888) #=> 'MMMDCCCLXXXVIII'

# ---------------------------------------------------------------------------
