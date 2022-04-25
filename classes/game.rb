require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multipayer, :last_played_at

  def initialize(multipayer, last_played_at, publish_date)
    super(publish_date, true)
    @multipayer = multipayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    last_play = Time.now.year - last_played_at.year
    super && last_play > 2
  end
end
