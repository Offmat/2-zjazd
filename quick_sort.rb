# Napisz program sortujący zadaną jako argumenty wywołania tablicę liczb metodą quick
# sort
# $ ruby quick_sort.rb 74 77 64 19 43 47 77 66 47 60 7 97 71 87 95 79
# 7 19 43 47 47 60 64 66 71 74 77 77 79 87 95 97
require "pry"

def quick_sort
  puts "Nie zadano tablicy to segregacji!" if ARGV.length == 0
  input_array = ARGV.map { |e| e.to_i }
  puts sort(input_array)
end



def sort(array)
  pattern = array.dup           #tu poczułem że samo przypisanie to kolejna nazwa dla tego samego obiektu:)
  c = array.length/2
  pivot = array.delete_at(c)    #inaczej nie będzie segregował dwuelementowej tablicy w której większy element jest pierwszy
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

quick_sort
