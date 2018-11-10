class Player
  attr_reader :name, :bank, :hand

  # по умолчанию создается Дилер, либо человек
  def initialize(name = 'Dealer')
    @name = name
    @bank = 100
    @hand = []
  end

  # сделать ставку
  def make_bet(value = 10)
    @bank -= value
  end

  def add_cards(some_cards)
    some_cards.each { |x| @hand << x }
    @hand
  end

  def count_points
    @hand.inject(0) { |sum, card| sum += card.points }
  end
end