class Product
  attr_accessor :name, :price
  def initialize(name, price)
    self.name = name
    self.price = price
  end
end


class Shop
  attr_accessor :name, :products
  def initialize(name)
    self.name = name
    self.products = []
  end

  def add_product(product, quantity=1)
    quantity.times { products << product }
  end

  def take(product_name)
    index = products.index { |product| product.name == product_name }
    return products.delete_at(index) if index
  end
end


class Client
  attr_accessor :list
  attr_reader :money, :name, :bag
  def initialize(name, money)
    @money = money
    @name = name
    @bag = []
    self.list = []
  end

  def perform_shopping(shop)
    success = true
    while product_name = list.pop
      product = shop.take(product_name)
      if product.price < @money
        bag << product
        @money -= product.price
      else
        shop.products << product
        success = false
      end
    end
    success
  end

  def please_buy(item)
    @list << item
  end
end

shop = Shop.new('Stonka')
shop.add_product(Product.new('chleb', 1), 10)
shop.add_product(Product.new('jogurt', 1.23), 4)
shop.add_product(Product.new('szynka', 5.99), 8)
janusz = Client.new('Janusz', 30)
janusz.list = ['chleb', 'jogurt', 'jogurt', 'szynka']
janusz.please_buy("szynka")
puts janusz.perform_shopping(shop)

puts janusz.inspect
