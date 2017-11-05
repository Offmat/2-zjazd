# rubocop:disable Style/AsciiComments
# Napisz program sortujący zadaną jako argumenty wywołania tablicę liczb metodą
# quick sort
# $ ruby quick_sort.rb 74 77 64 19 43 47 77 66 47 60 7 97 71 87 95 79
# 7 19 43 47 47 60 64 66 71 74 77 77 79 87 95 97

require 'pry'
require 'benchmark'
input_array = Array.new(1_000_000) { rand }

# input_array = ARGV.map(&:to_i) # to uruchomić żeby działało jak w zadaniu

# pierwszy sort jaki napisałem tydzień temu
def sort(array)
  pattern = array.dup
  c = array.length / 2
  pivot = array.delete_at(c)    # inaczej nie będzie segregował dwuelementowej tablicy w której większy element jest pierwszy
  ar1 = []
  ar2 = []
  # binding.pry
  array.each do |e|
    if e < pivot
      ar1.push(e)
    else
      ar2.push(e)
    end
  end
  ar1.push(pivot)
  ar1 = sort(ar1) if ar1.length > 1 && ar1 != pattern
  ar2 = sort(ar2) if ar2.length > 1 && ar2 != pattern
  ar1 + ar2
end

def switch(j, i, array)
  array[i], array[j] = array[j], array[i]
end

def move_under(place, i, c, array)
  array.insert(place, array.delete_at(i))
  c + 1
end

def move_above(place, i, c, array)
  array.insert(place, array.delete_at(i))
  c - 1
end

# minusem eacha jest to, że element przerzucony z początku na koniec jest sprawdzany na końcu jeszcze raz. Tu nie zadziała zamiana - musi być upychanie
def sort_new_with_each(array, b = 0, e = array.length-1)
  c = (e + b) / 2
  pivot = array[c]
  (b..e).each do |i|
    # binding.pry
    if array[i] < pivot && i > c
      c = move_under(b, i, c, array)
    elsif array[i] > pivot && i < c
      c = move_above(e, i, c, array)
      redo
    end
  end
  sort_new(array, b, c - 1) if c > b + 1
  sort_new(array, c + 1, e) if c < e - 1
  array
end
# a = [1, 8, 7, 6, 5]
# sort_new_with_each(a)

#problem z podwójnym sprawdzaniem załatwiony -> ilość sprawdzeń = ilość elementów. Tu nie zadziała zamiana - musi być upychanie
def sort_new_with_times(array, b = 0, e = array.length-1)
  c = (e + b) / 2
  pivot = array[c]
  i = b
  (e - b + 1).times do
    # binding.pry
    if array[i] < pivot && i > c
      c = move_under(b, i, c, array)
    elsif array[i] > pivot && i < c
      c = move_above(e, i, c, array)
      next
    end
    i += 1
  end
  sort_new(array, b, c - 1) if c > b + 1
  sort_new(array, c + 1, e) if c < e - 1
  array
end

# w końcu się poddałem i podejrzałem w internetach - stąd przesuwanie j i przerzucanie pivota na koniec
def sort_new(array, b = 0, e = array.length-1)
  c = (e + b) / 2
  pivot = array[c]
  j = b
  switch(e, c, array)
  # binding.pry
  (b..e - 1).each do |i|
    if array[i] <= pivot
      switch(j, i, array)
      j += 1
    end
  end
  switch(j, e, array)
  sort_new(array, b, j - 1) if j > b + 1
  sort_new(array, j + 1, e) if j < e - 1
  array
end

# sprawdza czy sortowanie dobrze działa z małym podglądem
def check_if_works
  100.times do
    ar = Array.new(1000) { rand }
    print ar[0..15].inspect
    puts '    <-   losowy'
    print made_by_ruby = ar.sort[0..15].inspect
    puts '    <-   rubiowy'
    print made_by_my_sort = sort_new(ar)[0..15].inspect
    puts '    <-   mój'
    puts made_by_ruby == made_by_my_sort
  end
end

# sprawdza wszystkie mteody
def check_all
  100.times do
    a = Array.new(1000) { rand }
    made_by_ruby = a.dup.sort
    puts sort(a.dup) == made_by_ruby
    puts sort_new_with_each(a.dup) == made_by_ruby
    puts sort_new_with_times(a.dup) == made_by_ruby
    puts sort_new(a.dup) == made_by_ruby
  end
end

# Benchmark dla wszystkich.
def benchmark(input_array)
  Benchmark.bmbm do |x|
    x.report("mój stary sort") { sort(input_array.dup) }
    # x.report("mój nowy sort - each") { sort_new_with_each(input_array.dup) }
    # x.report("mój nowy sort - times") { sort_new_with_times(input_array.dup) }
    x.report("mój nowy sort - kradziona idea:(") { sort_new(input_array.dup) }
    x.report("wbudowany") { input_array.dup.sort }
  end
end

benchmark(input_array)







# a = [1, 8, 7, 6, 5]
# p sort(a.dup)
# print "pownna być bazowa #{a}\n"
# p sort_new_with_each(a.dup)
# print "pownna być bazowa #{a}\n"
# p sort_new_with_times(a.dup)
# print "pownna być bazowa #{a}\n"
# p sort_new(a.dup)
# print "pownna być bazowa #{a}\n"
# p a.dup.sort
# print "pownna być bazowa #{a}\n"
