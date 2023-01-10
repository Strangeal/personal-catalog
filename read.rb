require 'json'

class Read
  def read_game
    games = []
    return games unless File.exist?('./data/game.json')

    file = File.open('data/game.json')
    file_data = JSON.parse(file.read)
    file_data.each do |game|
      game_data = Game.new(game['LastPlayed'])
      games << game_data
    end
    file.close
    games
  end
end
