# rubocop:disable Style/AsciiComments, Metrics/LineLength
# Napisz program do obsługi biblioteki. Powinien on umożliwiać:
# • wyświetlenie listy książek w bibliotece, z zaznaczeniem dostępnych oraz aktualnie
# wypożyczonych (lista książek nie powinna być udostępniona publicznie)
# • dodawanie nowych książek do listy dostępnych w bibliotece
# • wypożyczanie i oddawanie książek przez czytelników (niemożliwe jest
# wypożyczenie już wypożyczonej książki)
# • dodawanie nowych czytelników do biblioteki wraz z generowaniem im numeru karty
# bibliotecznej (powinien on składać się z liter oraz cyfr i być unikalny dla każdego
# czytelnika)
# • wyświetlenie listy książek wypożyczonych w danym momencie przez konkretnego
# czytelnika, wraz z datami wypożyczenia każdej z nich
# • wyświetlenie historii wypożyczeń danego czytelnika wraz z czasem
# przetrzymywania każdej z nich (uwzględniającej oddane już książki)Stwórz ok. 10 książek i 3 czytelników. Sprawdź manualnie poprawność działania
# programu.
# rubocop:enable Style/AsciiComments, Metrics/LineLength

require 'pry'

# biblioteka
class Library
  def initialize
    @books = []
    @users = []
  end

  def add_book
    print 'Name of the book: '
    name = gets.chomp
    print 'Author of the book: '
    author = gets.chomp
    print 'Kind of the book: '
    kind = gets.chomp
    @books << Book.new(name, author, kind)
  end

  def add_book_source(book)
    @books << book
  end

  def print_books
    @books.each { |book| puts book }
  end
end

# uzytkownik
class User
  def initialize(name)
    @name = name
    @books = []
    # id_number =
  end

  def loan(book)
    @loans << book
  end

  def return; end
end

# ksiazka
class Book
  def initialize(name, author, kind)
    @name = name
    @author = author
    @kind = kind
    @log = []
    @avalible = true
  end

  def to_s
    string = ''
    string << "Title: #{@name}".ljust(35) + "Author: #{@author}".ljust(25) + "Kind: #{@kind}".ljust(25)
    # binding.pry
    string << (@avalible == true ? 'Avalible' : 'Not avalible')
  end

  def sign_loaned
    @avalible = false
  end

  def sign_avalible
    @avalible = true
  end
end

library = Library.new
library.add_book_source(Book.new("Metro 2033", "D.Glukhowski", "Fantasy"))
library.add_book_source(Book.new("Metro 2034", "D.Glukhowski", "Fantasy"))
library.add_book_source(Book.new("Wyprawa czarownic", "T.Pratchett", "Fantasy"))
library.add_book_source(Book.new("Komórka", "S.King", "Fantasy"))
library.add_book_source(Book.new("Cztery pory roku", "S.King", "Fantasy"))
library.add_book_source(Book.new("Zgroza w Dunwich", "H.P.Lovecraft", "Horror"))
library.add_book_source(Book.new("Dzienniki gwiazdowe", "S.Lem", "Science fiction"))
library.add_book_source(Book.new("Teoria kwantowa nie gryzie", "M.Chown", "Popular science"))
library.add_book_source(Book.new("Krótka historia czasu", "S.Hawking", "Popular science"))
library.print_books
