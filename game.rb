class Game
  attr_reader :human, :comp

  def initialize
    # создаем колоду для этой игры при создании экземпляра
    @current_deck = Deck.new
  end
  # создаем игрока и дилера пользуясь классом Player и выводами и вводами через интерфейс
  def assign_players(interface)
    @human = Player.new(interface.greeting)
    @comp = Player.new
  end
  # первая раздача карт - по 2 карты - выводим полученные карты через интерфейс
  def first_deal(interface)
    human.add_cards(deal(2))
    comp.add_cards(deal(2))
    interface.show_first_deal(@human, @comp)
  end

  # метод для раздачи карт, берет первое n количество карт из перемешанной колоды
  def deal(number_of_cards)
    @current_deck.deck.shift(number_of_cards)
  end
end