require 'json'
require 'fileutils'

class Save
  def check_file(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/game.json') if !File.exist?('./data/game.json') && filename == 'game'
    FileUtils.touch('./data/author.json') if !File.exist?('./data/author.json') && filename == 'author'
  end

  def save_book(books)
    book_array = []
    books.each do |book|
      book_array << { publisher: book.publisher,
                      publish_date: book.publish_date,
                      cover_state: book.cover_state }
    end
    File.write('./data/books.json', JSON.pretty_generate(book_array)) unless book_array.empty?
  end

  def save_label(labels)
    label_array = []
    labels.each do |label|
      label_array << { title: label.title,
                       color: label.color }
    end
    File.write('./data/labels.json', JSON.pretty_generate(label_array)) unless label_array.empty?
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
