# rubocop:disable Style/AsciiComments
# Napisz program sortujący zadaną jako argumenty wywołania tablicę liczb metodą
# quick sort
# $ ruby quick_sort.rb 74 77 64 19 43 47 77 66 47 60 7 97 71 87 95 79
# 7 19 43 47 47 60 64 66 71 74 77 77 79 87 95 97
# rubocop:enable Style/AsciiComments

require 'pry'
require 'benchmark'
input_array = Array.new(100_000) { rand }

# input_array = ARGV.map(&:to_i)
input_array2 = input_array.dup
input_array3 = input_array.dup


def check_if_works
  10.times do
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





# pierwszy sort jaki napisałem tydzień temu
def sort(array)
  pattern = array.dup           # tu poczułem że samo przypisanie to kolejna nazwa dla tego samego obiektu:)
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

# czas dla 1 000 000 - po całym dniu pracy wzrósł mu do 52sekun!! mógł się tak komputer "zapchać" ?
# moj sort     4.410000   0.040000   4.450000 (  4.442020)
# wbudowany    0.840000   0.000000   0.840000 (  0.842860)

# nowy sort - miał być szybszy;]

def switch(j, i, array)
  array.insert(j, array.delete_at(i))
end

# def move_under(place, i, c, array)
#   array.insert(place, array.delete_at(i))
#   c + 1
# end
#
# def move_above(place, i, c, array)
#   array.insert(place, array.delete_at(i))
#   c - 1
# end

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


                    # (b..e).each do |i|
                    #   if array[i] < pivot && i > c
                    #     c = move_under(b, i, c, array)
                    #   elsif array[i] > pivot && i < c
                    #     c = move_above(e, i, c, array)
                    #     redo
                    #   end
                    # end
                    # sort_new(array, b, c - 1) if c > b + 1
                    # sort_new(array, c + 1, e) if c < e - 1
                    # array
                                              # i = b
                                              # (e - b + 1).times do
                                              #   # binding.pry
                                              #   if array[i] < pivot && i > c
                                              #     c = move_under(b, i, c, array)
                                              #   elsif array[i] > pivot && i < c
                                              #     c = move_above(e, i, c, array)
                                              #     next
                                              #   end
                                              #   i += 1
                                              # end
                                              # sort_new(array, b, c - 1) if c > b + 1
                                              # sort_new(array, c + 1, e) if c < e - 1
                                              # array
end



Benchmark.bmbm(10) do |x|
  x.report("mój sort") { sort(input_array) }
  x.report("mój nowy sort") { sort_new(input_array2) }
  x.report("wbudowany") { input_array3.sort }
end


# dla 100 000 dla wersji z (b..e).each
# Rehearsal -------------------------------------------------
# mój sort        0.870000   0.010000   0.880000 (  0.874458)
# mój nowy sort  22.420000   0.000000  22.420000 ( 22.432675)
# wbudowany       0.020000   0.000000   0.020000 (  0.019045)
# --------------------------------------- total: 23.320000sec



# dla 100 000 elementów z e-b+1.times
# Rehearsal -------------------------------------------------
# mój sort        0.810000   0.000000   0.810000 (  0.809866)
# mój nowy sort  22.950000   0.010000  22.960000 ( 22.975217)
# wbudowany       0.020000   0.000000   0.020000 (  0.020752)
# --------------------------------------- total: 23.790000sec

#                     user     system      total        real
# mój sort        0.810000   0.010000   0.820000 (  0.815747)
# mój nowy sort   0.170000   0.000000   0.170000 (  0.172187)
# wbudowany       0.020000   0.000000   0.020000 (  0.019359)
