require 'Date'
class Item 
  def initialize

  end

  def can_be_archived?
    (Date.today - Date.parse(@published_date)) >= 365 * 10
  end 

  def move_to_archive
    @archived = true if can_be_archived?
  end
end