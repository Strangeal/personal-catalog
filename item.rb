require 'date'
require_relative 'author'
class Item
  attr_accessor :id, :publish_date, :archived, :author
  attr_reader :genre

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @author = nil
    @label = nil
    @genre = nil
    @publish_date = publish_date
    @archived = archived
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(genre)
  end

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
