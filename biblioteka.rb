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

require "pry"


class Library
  def initialize
    @books = []
  end

  def add_book

  end

  def list_of_books

  end
end

class User
  def initialize(name)
    @name = name
    @books = []
    id_number =
  end

  def loan(book)
    @loans << book
  end

  def return

  end
end

class Book
  def initialize(name, author)
    @name = name
    @author = author
    @log = []
    @avalible = true
  end

  def sign_loaned
    @avalible = false
  end

    def sign_avalible
      @avalible = true
    end
end
