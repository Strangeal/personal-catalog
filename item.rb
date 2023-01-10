require 'date'
require_relative 'author'
class Item
  attr_accessor :id, :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @author = nil
    @source = nil
    @label = nil
    @genre = nil
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
