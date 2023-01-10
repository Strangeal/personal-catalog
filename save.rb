require 'json'
require 'fileutils'

class Save
  def check_file(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/game.json') if !File.exist?('./data/game.json') && filename == 'game'
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

  def self.save_music_to_file(music_album, dir)
    music_hash_array = []
    music_album.each do |song|
      music_hash_array << { publish_date: song.publish_date,
                            spotify: song.on_spotify,
                            genre: song.genre.name }
    end
    File.write(dir, JSON.generate(music_hash_array))
  end
end