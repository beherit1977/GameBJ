class Deck
  attr_reader :deck

  # метод продакт соединяет с каждым элементом два массива - четыре массива 52 карты
  def initialize
    # переменная в которой соединяются два массива констант класса card
    @deck = Card::SUITS.product(Card::FACES)
    # из полученной пары значений делается новая карта, таким образом собираем колоду под игру
    @deck.map { |suit, face| Card.new(suit, face) }
    # перемешиваем колоду и сохраняем в таком виде
    shuffle!
  end

  def shuffle!
    @deck.shuffle!
    self
  end
  # заготовка метода для раздачи карт, берет первое n количество карт из перемешанной колоды
  def deal(number_of_cards)
    @deck.shift(number_of_cards)
  end
end
