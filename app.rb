require_relative 'prompt'
require_relative 'item'
require_relative 'game'
require_relative 'menu'
require_relative 'music_album'
require_relative 'genre'

class App
  # Exit
  def list_all_books
    puts 'book list'
  end

  def initialize
    @game = []
    @authors = []
    @books = []
    @labels = []
    @music_album = []
    @genres = []
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
    puts "Enter Publish Date:"
    publish_date = gets.chomp
    puts "Is The Song On Spotify: [Y/N]"
    on_spotify = gets.chomp
    puts "Specify The Genre:"
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
    true if input.upcase == "Y"
    false
  end

  def exit_app
    puts "\n Thanks for using this app"
    exit
  end
end
