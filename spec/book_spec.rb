require_relative '../book'
require_relative '../item'

describe 'Book' do
  before :each do
    @book = Book.new('orelly', 'bad', '22/4/2000')
  end

  describe '#new' do
    it 'is an instance of Book' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'returns true when coverstate' do
      expect(@book.archived).to eql true
    end

    it 'returns true if parent method returns true OR if cover_state equals to "bad"' do
      @book.move_to_archive
      expect(@book.archived).to eql true
    end

    it 'inherits from Item class' do
      expect(@book).to be_kind_of(Item)
    end
  end
end
