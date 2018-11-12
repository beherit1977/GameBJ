class Game
  attr_reader :human, :comp, :game_over

  def initialize(interface)
    @current_deck = Deck.new
    @game_over = false
    @interface = interface
    assign_players(interface)
  end

  def start_game_session
    first_deal(@interface)
    black_jack? ? game_result(@interface) : player_turn(@interface)
  end

  def black_jack?
    (@human.count_points == 21) || (@comp.count_points == 21)
  end

  def game_result(interface)
    @game_over = true
    @interface.show_player_deal(@human)
    @interface.show_comp_deal(@comp, @game_over)
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
    @comp.add_cards(deal(2))
    @interface.show_player_deal(@human)
    @interface.show_comp_deal(@comp, @game_over)
  end

  def player_turn(interface)
    choice = interface.show_player_choice
    if choice == 1
      @human.add_cards(deal(1))
      @interface.show_player_deal(@human)
      dealer_turn(interface)
    elsif choice == 2
      @interface.show_player_deal(@human)
      dealer_turn(interface)
    else
      @game_over = true
      game_result(interface)
    end
  end

  def dealer_turn(interface)
    if @comp.count_points < 17
      @comp.add_cards(deal(1))
      interface.show_comp_deal(@comp, @game_over)
    else
      interface.show_comp_deal(@comp, @game_over)
      game_result(interface)
    end
  end
end
