require 'json'

class Read
  def load_books_from_file
    books = []
    return books unless File.exist?('./data/books.json')

    JSON.parse(File.read('data/books.json')).map do |book|
      publisher = book['publisher']
      publish_date = book['publish_date']
      cover_state = book['cover_state']
      books.push(Book.new(publisher, cover_state, publish_date))
    end
    books
  end

  def load_labels_from_file
    labels = []
    return labels unless File.exist?('./data/labels.json')

    JSON.parse(File.read('data/labels.json')).map do |label|
      title = label['title']
      color = label['color']
      new_label = Label.new(title, color)
      labels << new_label
    end
    labels
  end

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

  def self.read_file(dir)
    return false unless File.exist?(dir)

    File.read(dir)
  end

  def self.get_music_data(file_content, genres)
    return [] unless file_content

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
