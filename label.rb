require 'date'
require_relative './item'

class Label < Item
  attr_accessor :title, :color, :items

  def initialize(title, color)
    super
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.add_label(self)
    @items << item unless @items.include?(item)
  end
end
