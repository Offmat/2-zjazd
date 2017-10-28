# Napisz program wyszukujący wszystkie liczby pierwsze z zadanego przedziału jako
# argumenty wywołania metodą Sita Eratostenesa
# $ ruby sieve_of_eratosthenes.rb 1 10
# Prime numbers: 2, 3, 5, 7

require "pry"
class SievieOfEratostenes
  attr_reader :array
  def initialize
    if ARGV.length == 2
      @array = (ARGV[0].to_i..ARGV[1].to_i).to_a
    else
      puts "Please input range for prime numbers search"
      @array = (gets.to_i..gets.to_i).to_a
    end
    execute
  end

  private

  def delete_mult(n)
    del = n+n
    while del <= @array[-1]
      @array.delete(del)
      del += n
    end
  end

  def execute
    n = 2
    @array.delete(1)
    while n <= Math.sqrt(@array[-1])
      delete_mult(n)
      n += 1
    end
    puts "There is #{@array.length} prime numbers:"
    puts @array
  end
end

# binding.pry
SievieOfEratostenes.new
