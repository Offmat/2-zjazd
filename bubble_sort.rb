# Napisz program sortujący zadaną jako argumenty wywołania tablicę liczb metodą
# sortowania bąbelkowego
# $ ruby bubble_sort.rb 74 77 64 19 43 47 77 66 47 60 7 97 71 87 95 79
# 7 19 43 47 47 60 64 66 71 74 77 77 79 87 95 97
require "pry"

class BubbleSort
  def initialize
    @array = ARGV.map { |e| e.to_i }
    puts "Nie zadano tablicy to segregacji!" if @array.length == 0
    @counter = 0
    sort
  end


  def check_switch(n)
    if @array[n] > @array[n+1]
      @array[n], @array[n+1] = @array[n+1], @array[n]
      @flag = true
    end
    @counter +=1
  end


  def sort
    (2..@array.length).each do |e|
      @flag = false
      binding.pry
      (0..@array.length-e).each {|n| check_switch(n)}
      break if @flag == false
    end
    puts @array.inspect
    puts @counter
  end

end


BubbleSort.new
