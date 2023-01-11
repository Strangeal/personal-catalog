require_relative '../author'
require_relative '../game'
require_relative '../item'

describe Author do
  before :each do
    @new_author = Author.new('John', 'Doe')
    @new_game = Game.new('2010/09/04', multiplayer: true)
  end

  it 'first-name should return "John" ' do
    first_name = @new_author.first_name
    expect(first_name).to eql('John')
  end

  it 'second-name should return "Doe" ' do
    second_name = @new_author.second_name
    expect(second_name).to eql('Doe')
  end
  it 'can add_item be used' do
    expect(@new_author).to respond_to(:add_item)
  end

  it 'add item test' do
    expect(@new_author.items.count).to eql 0

    @new_author.add_item(@new_game)
    expect(@new_author.items.count).to eq 1
  end
end
