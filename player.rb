 class Player
  attr_reader :name, :bank, :hand

  # по умолчанию создается Дилер, либо человек
  # добавил массив карт в руке
  def initialize(name = 'Dealer')
    @name = name
    @bank = 100
    @hand = []
  end

  # сделать ставку
  def make_bet(value = 10)
    @bank -= value
  end

  # добавляет в переменную hand те карты которые раздают
  def add_cards(some_cards)
    some_cards.each { |x| @hand << x }
    @hand
  end
end