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
    (item.is_a?(Item) && @items.include?(item)) || (@items << item)
    item.add_label(self)
  end
end
