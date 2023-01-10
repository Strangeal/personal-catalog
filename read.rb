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

  def read_author
    authors = []
    return authors unless File.exist?('./data/author.json')

    file = File.open('./data/author.json')
    file_data = JSON.parse(file.read)
    file_data.each do |author|
      authors.push(Author.new(author['FirstName'], author['SecondName']))
    end
    file.close
    authors
  end
end
