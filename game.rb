require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    return true if can_be_archived? && last_played_at >= 365 * 2

    false
  end
end
