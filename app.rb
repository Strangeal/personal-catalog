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
    @books = Read.new.load_books_from_file
    @labels = Read.new.load_labels_from_file
    @genres = []
    @music_album = Read.get_music_data(Read.read_file('./data/music.json'), @genres)
    @authors = Read.new.read_author
  end

  def add_book
    print "\n Publisher: "
    publisher = gets.chomp
    print 'Date of publish: '
    publish_date = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    label = handle_label
    book = Book.new(publisher, cover_state, publish_date)
    label.add_item(book)
    @labels << label unless @labels.include?(label)
    @books << book
    puts 'Book added successfully 🤗'
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
        print 'invalid 😬 entry'.upcase
      end
    else
      add_label
    end
  end

  def list_all_books
    puts 'No Books available 😔'.upcase if @books.empty?
    @books.each_with_index do |book, i|
      puts 'Available books 📚'.upcase
      puts "#{i}) cover_state: #{book.cover_state} | publisher: #{book.publisher} | publish_date:#{book.publish_date}"
    end
    default_return
  end

  def list_all_labels
    if @labels.empty?
      puts 'You have not added any labels yet 😬'.upcase
    else
      @labels.each_with_index do |label, index|
        puts "#{index}) Title: #{label.title}, Color: #{label.color}"
      end
    end
    default_return
  end

  def default_return
    puts "\n Hit any key to return to menu"
    gets.chomp
    LibraryMenu.new.menu
  end

  def add_game
    multiplayer = multiplayer?
    puts "\n When was the last time you played this game "
    last_played = gets.chomp
    new_game = Game.new(last_played, multiplayer: multiplayer)
    @game << new_game
    puts 'Game added 🤗 successfully'.upcase
    default_return
  end

  def add_author
    print 'First name: '
    first_name = gets.chomp
    print 'Second name: '
    second_name = gets.chomp
    author_data = Author.new(first_name, second_name)
    @authors << author_data
    puts 'Author added successfully 🤗'
    default_return
  end

  def multiplayer?
    print 'Multiple player game?[Y/N]: '
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
    puts "\n No Games available 😔".upcase if @game.empty?
    @game.each_with_index do |list, i|
      puts 'Available games '.upcase
      puts "#{i}) Multiplayer: #{list.multiplayer} | Last-Played: #{list.last_played_at}"
    end
    default_return
  end

  def list_authors
    puts "\n No author added 😬".upcase if @authors.empty?

    @authors.each_with_index do |list, i|
      puts 'Available authors '.upcase
      puts "#{i}) First-Name: #{list.first_name} | Last-Name: #{list.second_name}"
    end
    default_return
  end

  def add_musicalbum
    print 'Enter Publish Date: '
    publish_date = gets.chomp
    print 'Is The Song On Spotify: [Y/N] '
    on_spotify = gets.chomp
    print 'Specify The Genre: '
    input_genre = gets.chomp
    genre = Genre.new(input_genre)
    @genres << genre
    song = MusicAlbum.new(publish_date, check_input(on_spotify))
    song.add_genre(genre)
    @music_album << song
    puts 'Music album added successfully 🤗'
    default_return
  end

  def list_all_music
    puts 'No music 🎧 album available 😔'.upcase if @music_album.empty?
    @music_album.each_with_index do |song, i|
      puts "#{i}) Publish Date: #{song.publish_date} | Spotify: #{song.on_spotify}"
    end
    default_return
  end

  def list_all_genres
    puts 'No genre available 😔'.upcase if @genres.empty?
    @genres.each_with_index do |genre, i|
      puts "#{i}) Genre: #{genre.name} "
    end
    default_return
  end

  def check_input(input)
    true if input.upcase == 'Y'
    false
  end

  def exit_app
    Save.new.save_book(@books)
    Save.new.save_label(@labels)
    Save.new.save_game(@game)
    Save.save_music_to_file(@music_album, './data/music.json')
    Save.new.save_author(@authors)
    puts "\n Thanks 🤗 for using this app".upcase
    exit
  end
end
