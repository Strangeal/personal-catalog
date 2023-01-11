require_relative '../music_album'
require_relative '../genre'

describe MusicAlbum do
  music_album = MusicAlbum.new('2020-2-2', true)
  genre = Genre.new('Folk')
  music_album.add_genre(genre)

  it 'sould be valid instance' do
    expect(music_album).to be_instance_of MusicAlbum
  end

  it 'archived property should be false' do
    expect(music_album.archived).to be false
  end

  it 'on_spotify property should be true' do
    expect(music_album.on_spotify).to be true
  end

  it 'genre property should have a Ganre object' do
    expect(music_album.genre).to be_instance_of Genre
  end

  it 'genre object should have name property of Folk' do
    expect(music_album.genre.name).to eq 'Folk'
  end
end
