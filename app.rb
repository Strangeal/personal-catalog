require_relative 'prompt'
require_relative 'item'
require_relative 'game'
require_relative 'menu'

class App
  # Exit
  def initialize
    @game = []
    @authors = []
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
    new_game = Game.new(multiplayer, last_played)
    @game << new_game
    puts "Game added 🤗 successfully"
    default_return
  end

  def multiplayer?
    puts "Multiple player game?[Y/N]"
    multiplayer = gets.chomp.upcase
    case multiplayer
      when 'Y' then true
      when 'N' then false
      else
        puts "Incorrect 😔 input: Please select [Y/N]"
        multiplayer?
    end
  end

  def list_games
    if @game.empty?
      puts "\n No Games available 😔"
    end
    puts 'Available games '
    @game.each_with_index do
    |list, i| puts "#{i}) Multiplayer: #{list.multiplayer} Last-Played: #{list.last_played}"
  end
  default_return
  end

  def list_authors
     if @authors.empty?
      puts "\n No author added"
    end
    puts 'Available authors '
    @authors.each_with_index do
      |list, i| puts "#{i}) First-Name: #{list.first_name} Last-Name: #{list.second_name}"
  end
  default_return
  end


  def exit_app
    puts "\n Thanks for using this app"
    exit
  end
end
