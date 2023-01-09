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
end