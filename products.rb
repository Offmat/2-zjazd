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
# flour 1.99zł
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

  def add(name, price, weight)
    @products.push(Product.new(name, price, weight))
  end

  def find(name)
    @products.each do |product|
      puts product if product.name == name
    end
  end

  def greater(price)
    @products.each do |product|
      puts product if product.price > price
    end
  end

  def lesser(price)
    @products.each do |product|
      puts product if product.price < price
    end
  end

  def convert(rate, file_name)
    @products.each do |product|
      product.price = (product.price / rate).round(2)
    end
    CSV.open(file_name, "wb") do |csv|
      @products.each do |product|
        csv << [product.name, product.price, product.weight]
      end
    end
  end

end

class Product
  attr_reader :name, :price, :weight
  attr_writer :price
  def initialize(name, price, weight)
    @name = name
    @price = price.to_f
    @weight = weight.to_f
  end

  def to_s
    name + " " + price.to_s
  end
end


def menu(collection)
  collection.find(ARGV[1]) if ARGV[0] == "-f"
  collection.greater(ARGV[1].to_f) if ARGV[0] == "-gt"
  collection.lesser(ARGV[1].to_f) if ARGV[0] == "-lt"
  collection.convert(ARGV[1].to_f, ARGV[3]) if ARGV[0] == "-c"
end



warehouse = Warehouse.new
CSV.foreach("products.csv") do |r|
  warehouse.add(r[0], r[1], r[2])    #czy to jest jakiś problem, że jako pierwszy produkt stworzyłem produkt z nagłówkami? Powinienem wyrzucić jakos ten obiekt z tablicy?
end
# binding.pry
menu(warehouse)
