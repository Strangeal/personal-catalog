require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(*args, last_played_at, multiplayer: false)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = can_be_archived?
  end

  def can_be_archived?
    @archived = super && last_played_at >= 365 * 2
  end
end
