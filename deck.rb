require_relative 'card'
class Deck
  attr_reader :deck

  def initialize
    @deck = Card::SUITS.product(Card::FACES).map do |suit, face| Card.new(suit, face)
    end
    shuffle!
  end

  def shuffle!
    @deck.shuffle!
    self
  end
end
