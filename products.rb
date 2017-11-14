# Załączony plik products.csv (format CSV) zawiera nazwy produktów, ich ceny oraz
# wagę. Napisz program, który:
# • wczyta produkty oraz ich ceny z pliku products.csv
# • umożliwi wyszukanie produktu po jego nazwie
# $ ruby products.rb -f apple
# apple 1.25zł
# • umożliwi wyświetlenie produktów tańszych/droższych od podanej w argumencie
# ceny
# $ ruby products.rb -gt 2.25
# orange 2.50zł
# carrot 2.30zł
# juice 5.50zł
# chocolate 7.20zł
# $ ruby products.rb -lt 2.25
# sunflower seeds 0.99zł
# oil 2.22zł
# cookies 2.20zł
# flour 1.99zł#
# sugar 2.00zł
# • umożliwi konwersję cen produktów do innej waluty po zadanym w argumencie
# wywołania kursie, dane po konwersji zapisze do pliku o zadanej w argumencie
# wywołania nazwie$ ruby products.rb -c 3.45 EUR productsEUR.csv
# Przydatne linki:
# • CSV - klasa dostarczająca interfejs do obsługi plików .csv (wymaga dodania require
# "csv" )


require "csv"
require "pry"

class Warehouse
  def initialize
    @products = []
  end

  def print(product)
    puts product[0].ljust(13, ".") + " " + product[1].to_s + "zł"
  end

  def add(object)
    if object.header_row?
      @headers = object
    else
      @products.push(object)
    end
  end

  def print_products
    @products.each do |product|
      print(product) if yield(product)
    end
  end

  def convert(rate, curr, file_name)
    @headers[1] = "Price(#{curr})"
    @products.each do |product|
      product[1] = (product[1] / rate).round(2)
    end
    CSV.open(file_name, 'w') do |csv|
      csv << @headers
      @products.each do |product|
        csv << product
      end
    end
  end
end

def menu(collection)
  case ARGV[0]
  when '-f'
    collection.print_products { |product| ARGV[1] == product[0] }
  when '-gt'
    collection.print_products { |product| product[1] > ARGV[1].to_f }
  when '-lt'
    collection.print_products { |product| product[1] < ARGV[1].to_f }
  when '-c'
    collection.convert(ARGV[1].to_f, ARGV[2], ARGV[3])
  end
end

warehouse = Warehouse.new
CSV.foreach("products.csv", converters: :float, headers: true, return_headers: true) do |r|
  # binding.pry
  warehouse.add(r)
end
# binding.pry
menu(warehouse)
