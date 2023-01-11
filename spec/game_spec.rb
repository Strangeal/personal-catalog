require_relative '../game'

describe Game do
  before :each do
    @new_game = Game.new('2010/09/04', multiplayer: true)
  end

  it 'multiplayer should return true' do
    multiplayer = @new_game.multiplayer
    expect(multiplayer).to be_truthy
  end

  it 'date should return 2010/09/04' do
    date = @new_game.last_played_at
    expect(date).to eql('2010/09/04')
  end

  it 'can_be_archived? should return true' do
    check = @new_game.archived
    expect(check).to be_truthy
  end

  it 'Game should be a class of Item' do
    expect(@new_game).to be_kind_of(Item)
  end
end
