# require "csv"
require "pry"
require "benchmark"
#
# CSV.foreach("products.csv", converters: :float, headers: true, return_headers: true) do |r|
#   puts r
#   puts r.inspect
#   puts r.class
#   puts r.header_row?
#   # binding.pry
# end


# puts "%020s" % "ble"


# class Cat
#
#   def meow
#     puts "Meow"
#     puts "2"
#   end
#
# end
#
# binding.pry
# Cat.new.meow
b = []
array = [1,2,3,4,5,6,7]
n = 100_000_000
Benchmark.bmbm(10) do |x|
  x.report("z pierwszego sortu") { n.times do; b << 1; end }
  x.report("mój nowy sort") { n.times do; array.insert(2, array.delete_at(4)); end }
  x.report("test") { n.times do; array[2], array[4] = array[4, array [2]]; end }
end
