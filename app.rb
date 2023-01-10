require_relative 'prompt'
require_relative 'item'
require_relative 'game'
require_relative 'menu'
require_relative 'music_album'

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

  def add_musicalbum(publish_date, on_spotify)
    @music_album << MusicAlbum.new(publish_date, on_spotify)
  end

  def exit_app
    puts "\n Thanks for using this app"
    exit
  end
end
