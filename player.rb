class Player
  attr_reader :name, :bank

  # по умолчанию создается Дилер
  def initialize(name = 'Dealer')
    @name = name
    @bank = 100
  end

  # сделать ставку
  def make_bet(value = 10)
    @bank -= value
  end
end