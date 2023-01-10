require 'json'
require 'fileutils'

class Save
  def check_file(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/game.json') if !File.exist?('./data/game.json') && filename == 'game'
    FileUtils.touch('./data/author.json') if !File.exist?('./data/author.json') && filename == 'author'
  end

  def save_game(game)
    game_arr = []
    game.each do |data|
      game_prop = { LastPlayed: data.last_played_at }
      game_prop[:multiplayer] = data.multiplayer
      game_arr << game_prop
    end
    return if game_arr.empty?

    check_file('game')
    File.write('./data/game.json', JSON.pretty_generate(game_arr))
  end

  def dave_author(author)
    author_arr = []
    author.each do |data|
      author_arr << { FirstName: data.first_name, LastName: data.second_name }
    end
    return if author_arr.empty?

    check_file('author')
    File.write('./data/author.json', JSON.pretty_generate(author_arr))
  end
end
