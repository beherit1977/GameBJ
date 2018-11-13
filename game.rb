class Game
  attr_reader :human, :comp, :game_over

  def initialize(interface)
    @current_deck = Deck.new
    @game_over = false
    @interface = interface
    assign_players(interface)
  end

  def assign_players(interface)
    @human = Player.new(interface.greeting)
    @comp = Player.new
  end

  def start_game_session
    first_deal
    black_jack? ? game_result : player_turn
  end

  def black_jack?
    (@human.count_points == 21) || (@comp.count_points == 21)
  end

  def deal(number_of_cards)
    @current_deck.deck.shift(number_of_cards)
  end

  def first_deal
    @human.add_cards(deal(2))
    @comp.add_cards(deal(2))
    @interface.show_player_deal(@human)
    @interface.show_comp_deal(@comp, @game_over)
  end

  def player_turn
    choice = @interface.show_player_choice
    if choice == 1
      @human.add_cards(deal(1))
      @interface.show_player_deal(@human)
      dealer_turn
    elsif choice == 2
      @interface.show_player_deal(@human)
      dealer_turn
    else
      @game_over = true
      game_result
    end
  end

  def dealer_turn
    if @comp.count_points < 17
      @comp.add_cards(deal(1))
      @interface.show_dealer_hit
      game_result
    else
      @interface.show_dealer_stay
      game_result
    end
  end

  def game_result
    @game_over = true
    @interface.show_game_over
    @interface.show_player_deal(@human)
    @interface.show_comp_deal(@comp, @game_over)
    count_result
  end

  def count_result
    if (@human.count_points > 21) && (@comp.count_points > 21)
      @interface.show_lose
      return
    elsif @human.count_points == @comp.count_points
      @interface.show_tie
    else
      game_win
    end
  end

  def game_win
    if black_jack?
      @interface.show_bj_win
      choose_winner
    elsif
      choose_winner
    end
  end

  def choose_winner
    if @human.count_points > 21
      @interface.show_comp_win(@comp)
    elsif @comp.count_points > 21
      @interface.show_human_win(@human)
    elsif @human.count_points > @comp.count_points
      @interface.show_human_win(@human)
    else
      @interface.show_comp_win(@comp)
    end
  end
end
