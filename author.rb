require_relative 'item'

class Author < Item
  attr_accessor :first_name, :second_name, :items

  def initialize(first_name, second_name)
    super
    @int = Random.rand(1..1000)
    @first_name = first_name
    @second_name = second_name
    @items = []
  end

  def add_item(item)
    @items << item
    Item.new(item, self)
  end
end
