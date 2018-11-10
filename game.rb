class Game
  attr_reader :human, :comp

  def initialize
    @current_deck = Deck.new
  end

  def assign_players(interface)
    @human = Player.new(interface.greeting)
    @comp = Player.new
  end

  def deal(number_of_cards)
    @current_deck.deck.shift(number_of_cards)
  end

  def first_deal(interface)
    @human.add_cards(deal(2))
    comp.add_cards(deal(2))
    interface.show_player_deal(@human)
    interface.show_comp_deal(@comp)
  end

  def player_choice(interface)
    choice = interface.show_player_choice
    if choice == 1
      @human.add_cards(deal(1))
      interface.show_player_deal(@human)
    elsif choice == 2
      interface.show_player_deal(@human)
    else
      puts "open cards"
    end
  end
end