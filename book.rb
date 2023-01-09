require 'date'
require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :archived, :publish_date

  def initialize(publisher, cover_state, publish_date)
    super
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    @archived = if super || @cover_state == 'bad'
                  true
                else
                  false
                end
  end
end
