require_relative 'prompt'
require_relative 'item'
require_relative 'game'
require_relative 'menu'
require_relative 'music_album'
require_relative 'genre'
require_relative 'book'
require_relative 'label'
require 'date'
require_relative 'read'
require_relative 'save'

class App
  def initialize
    @game = Read.new.read_game
    @books = []
    @labels = []
    @music_album = []
    @genres = []
    @game = []
    @authors = []
  end

  def add_book
    print 'publisher: '
    publisher = gets.chomp
    print 'date of publish: '
    publish_date = gets.chomp
    print 'cover state: '
    cover_state = gets.chomp
    label = handle_label
    book = Book.new(publisher, cover_state, publish_date)
    label.add_item(book)
    @labels << label unless @labels.include?(label)
    @books << book
    puts 'Book added successfully'
  end

  def add_label
    print 'label title: '
    title = gets.chomp
    print 'label color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def handle_label
    if @labels.any?
      print "enter 'N' to create a new label or 'S' to select an existing one"
      option = gets.chomp.upcase
      case option
      when 'N'
        add_label
      when 'S'
        puts 'select a label from the list by index'
        list_all_labels
        option = gets.chomp
        @labels[option.to_i]
      else
        print 'invalid entry'
      end
    else
      add_label
    end
  end

  def list_all_books
    puts 'No Books available 😔' if @books.empty?
    puts 'Available books'
    @books.each_with_index do |book, index|
      puts "#{index}) cover_state: #{book.cover_state}, publisher: #{book.publisher}, publish_date:#{book.publish_date}"
    end
    default_return
  end

  def list_all_labels
    if @labels.empty?
      puts 'You have not added any labels yet'.upcase
    else
      @labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title}, Color: #{label.color}" }
    end
  end

  def default_return
    puts "\n Hit any key to return to menu"
    gets.chomp
    LibraryMenu.new.menu
  end

  def add_game
    multiplayer = multiplayer?
    puts 'When was the last time you played this game '
    last_played = gets.chomp
    new_game = Game.new(last_played, multiplayer: multiplayer)
    @game << new_game
    puts 'Game added 🤗 successfully'
    default_return
  end

  def add_author
    print 'First name: '
    first_name = gets.chomp
    print 'Second name: '
    second_name = gets.chomp
    author_data = Author.new(first_name, second_name)
    @author << author_data
    default_return
  end

  def multiplayer?
    puts 'Multiple player game?[Y/N]'
    multiplayer = gets.chomp.upcase
    case multiplayer
    when 'Y' then true
    when 'N' then false
    else
      puts 'Incorrect 😔 input: Please select [Y/N]'
      multiplayer?
    end
  end

  def list_games
    puts "\n No Games available 😔" if @game.empty?
    puts 'Available games '
    @game.each_with_index do |list, i|
      puts "#{i}) Multiplayer: #{list.multiplayer} Last-Played: #{list.last_played_at}"
    end
    default_return
  end

  def list_authors
    puts "\n No author added" if @authors.empty?
    puts 'Available authors '
    @authors.each_with_index do |list, i|
      puts "#{i}) First-Name: #{list.first_name} Last-Name: #{list.second_name}"
    end
    default_return
  end

  def add_musicalbum
    puts 'Enter Publish Date:'
    publish_date = gets.chomp
    puts 'Is The Song On Spotify: [Y/N]'
    on_spotify = gets.chomp
    puts 'Specify The Genre:'
    input_genre = gets.chomp
    genre = Genre.new(input_genre)
    @genres << genre
    song = MusicAlbum.new(publish_date, check_input(on_spotify))
    song.add_genre(genre)
    @music_album << song
    default_return
  end

  def list_all_music
    @music_album.each_with_index do |song, i|
      puts "#{i} - Publish Date: #{song.publish_date} ; Spotify: #{song.on_spotify}"
    end
    default_return
  end

  def list_all_genres
    @genres.each_with_index do |genre, i|
      puts "#{i} - Genre: #{genre.name} "
    end
    default_return
  end

  def check_input(input)
    true if input.upcase == 'Y'
    false
  end

  def exit_app
    Save.new.save_game(@game)
    puts "\n Thanks for using this app"
    exit
  end
end
