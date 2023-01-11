require_relative '../label'

describe 'Unit Tests for Label Class' do
  before :each do
    @label = Label.new('ruby', 'blue')
    @item = Item.new('2011-12-2', false)
  end

  context 'initialize object' do
    it 'should be an instance of Label' do
      expect(@label).to be_instance_of Label
    end

    it 'should be a kind of Item' do
      expect(@label).to be_kind_of Item
    end
  end

  context 'title' do
    it 'should be "ruby"' do
      expect(@label.title).to eql 'ruby'
    end
  end

  context 'items' do
    it 'has items as an empty array' do
      expect(@label.items).to be_empty
    end

    it 'adds an item to items' do
      @label.add_item(@item)
      expect(@label.items[0]).to be(@item)
    end
  end

  context 'color' do
    it 'should be "blue"' do
      expect(@label.color).to eql 'blue'
    end
  end
end
