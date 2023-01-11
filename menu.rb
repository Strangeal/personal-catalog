require 'colorize'

class LibraryMenu
  def menu
    list = '
    1 - List all books
    2 - List all music albums
    3 - List of games
    4 - List all genres
    5 - List all labels
    6 - List all authors
    7 - Add a book
    8 - Add a music album
    9 - Add a author
    10 - Add a game
    11 - Exit
    '
    puts "\n Please choose an option from the list below"
    puts list.blue
  end
end
