require 'Date'
class Item 
  def initialize
    @published_date = nil
    @archived = false
  end

  def can_be_archived?
    (Date.today - Date.parse(@published_date)).to_i >= 365 * 10
  end 

  def move_to_archive
    @archived = true if can_be_archived?
  end
end