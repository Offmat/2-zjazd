require "csv"
require "pry"

CSV.foreach("products.csv", converters: :float, headers: true, return_headers: true) do |r|
  puts r
  puts r.inspect
  puts r.class
  # binding.pry
end
