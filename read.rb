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

  def self.read_file(dir)
    return false unless File.exist?(dir)
    File.read(dir)
  end

  def self.get_music_data(file_content, genres)
    music_album = []
    music_json_array = JSON.parse(file_content)
    music_json_array.each do |song|
      item_genre = Genre.new(song['genre'])
      item_song = MusicAlbum.new(song['publish_date'], song['spotify'])
      item_song.add_genre(item_genre)
      genres << item_genre
      music_album << item_song
    end
    music_album
  end
end
