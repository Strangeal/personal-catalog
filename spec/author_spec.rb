require_relative '../author'

describe Author do
  before :each do
    @new_author = Author.new('John', 'Doe')
  end

  it 'first-name should return "John" ' do
    first_name = @new_author.first_name
    expect(first_name).to eql('John')
  end

  it 'second-name should return "Doe" ' do
    second_name = @new_author.second_name
    expect(second_name).to eql('Doe')
  end

  # it 'add item test' do
  #   new_item = Item.new('2010/09/04', archived: true)
  # end
end