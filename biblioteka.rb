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

  def add_book(book)
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
  def initialize(name, author)
    @name = name
    @author = author
    @log = []
    @avalible = true
  end

  def to_s
    string << "Title: #{name}".ljust(35) + "Author: #{author}".ljust(25)
    string << if @avalible == true
                'Avalible'
              else
                'Not avalible'
              end
  end

  def sign_loaned
    @avalible = false
  end

  def sign_avalible
    @avalible = true
  end
end

# library.add_book(Book.new"Metro 2033", "D.Glukhowski", "Fantasy")
#
# book=Book.new
# book.series_on
# book.series_name="Metro"
# book.volume="2"
# book.name="Metro 2034"
# book.author="D.Glukhowski"
# book.rate=7.5
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Wyprawa czarownic"
# book.author="T.Pratchett"
# book.rate="??"
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Komórka"
# book.author="S.King"
# book.rate=7.2
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Cztery pory roku"
# book.author="S.King"
# book.rate=8.2
# book.kind="Fantasy"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Zgroza w Dunwich"
# book.author="H.P.Lovecraft"
# book.rate=8.4
# book.kind="Horror"
# book.comment="no comment"
# bookshelf.books<<book
#
# book=Book.new
# book.name="Dzienniki gwiazdowe"
# book.author="S.Lem"
# book.rate=8.6
# book.kind="Science fiction"
# book.comment="no comment"
# bookshelf.books<<book
