require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(last_played_at, multiplayer: false)
    super(last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = can_be_archived?
  end

  def can_be_archived?
    @archived = super && last_played_at > 2
  end
end
