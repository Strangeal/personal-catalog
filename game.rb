require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(last_played_at, multiplayer: false)
    super(last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = can_be_archived?
  end

  def can_be_archived?
    @archived = super && Date.today.year - Date.parse(@last_played_at).year > 2
  end
end
