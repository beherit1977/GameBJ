class Player
  attr_reader :name, :hand
  attr_accessor :bank

  def initialize(name = 'Дилер')
    @name = name
    @bank = 100
    @hand = []
  end

  def make_bet(value = 10)
    @bank -= value if enough_money?
    value
  end

  def enough_money?
    @bank >= 10
  end

  def add_cards(some_cards)
    some_cards.each { |x| @hand << x }
    @hand
  end

    def count_points
    sum = @hand.inject(0) { |sum, card| sum += card.points }
    count = @hand.count { |x| x.face == :Туз }
    sum -= 10 if (count == 2 && name != 'Дилер')
    sum -= 20 if (count == 3 && name != 'Дилер')
    sum
  end
end
