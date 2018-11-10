require_relative 'card'
class Deck
  attr_reader :deck

  def initialize
    # из полученной пары значений делается новая карта, таким образом собираем колоду под игру
    @deck = Card::SUITS.product(Card::FACES).map do |suit, face| Card.new(suit, face)
    end
    shuffle!
  end

  def shuffle!
    @deck.shuffle!
    self
  end
end
