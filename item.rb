require 'Date'
class Item
  def initialize
    @published_date = nil
class Item 
  attr_accessor :author, :source, :label, :genre
  def initialize
    @id = Random.rand(1..1000)
    @author = nil
    @source = nil
    @label = nil
    @genre = nil
    @publish_date = Date.today
    @archived = false
  end

  def can_be_archived?
    (Date.today - Date.parse(@published_date)).to_i >= 365 * 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
