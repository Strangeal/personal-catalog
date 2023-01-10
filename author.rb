require_relative 'item'

class Author
  attr_accessor :first_name, :second_name
  attr_reader :items

  def initialize(first_name, second_name)
    @int = Random.rand(1..1000)
    @first_name = first_name
    @second_name = second_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
