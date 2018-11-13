class Game
  attr_reader :human, :comp, :game_over, :bank

  def initialize(interface)
    @interface = interface
    assign_players(interface)
  end

  def assign_players(interface)
    @human = Player.new(interface.greeting)
    @comp = Player.new
    @players = [@human, @comp]
  end

  def start_game_session
    next_round_reset
    @interface.show_make_bet
    @game_bank = (@human.make_bet + @comp.make_bet)
    first_deal
    black_jack? ? game_result : player_turn
  end

  def bankrupt?
    @human.bank < 10 || @comp.bank < 10
  end

  def black_jack?
    (@human.count_points == 21) || (@comp.count_points == 21)
  end

  def next_round_reset
    @game_over = false
    @game_bank = 0
    @current_deck = Deck.new
    @interface.show_banks(@human, @comp)
  end

  def deal(number_of_cards)
    @current_deck.deck.shift(number_of_cards)
  end

  def first_deal
    @players.each(&:delete_cards)
    @players.each { |x| x.add_cards(deal(2)) }
    @interface.show_player_deal(@human)
    @interface.show_comp_deal(@comp, @game_over)
  end

  def player_turn
    choice = @interface.show_player_choice
    @human.add_cards(deal(1)) if choice == 1
    if choice == 3
      @game_over = true
      return game_result
    end

    @interface.show_player_deal(@human)
    dealer_turn
  end

  def dealer_turn
    if @comp.count_points < 17
      @comp.add_cards(deal(1))
      @interface.show_dealer_hit
    else
      @interface.show_dealer_stay
    end
    game_result
  end

  def game_result
    @game_over = true
    @interface.show_game_results
    @interface.show_player_deal(@human)
    @interface.show_comp_deal(@comp, @game_over)
    count_result
  end

  def count_result
    if (@human.count_points > 21) && (@comp.count_points > 21)
      @interface.show_lose
      return_bets
    elsif @human.count_points == @comp.count_points
      @interface.show_bj_win if black_jack?
      @interface.show_tie
      return_bets
    else
      game_win
    end
  end

  def return_bets
    @human.bank += (@game_bank / 2)
    @comp.bank += (@game_bank / 2)
    @interface.show_return_bets(@human, @comp)
  end

  def game_win
    @interface.show_bj_win if black_jack?

    if @comp.count_points > 21 ||
       (@human.count_points < 21 && @human.count_points > @comp.count_points)
      human_win
      @interface.show_game_win(@human)
    else
      comp_win
      @interface.show_game_win(@comp)
    end
  end

  def comp_win
    @comp.bank += @game_bank
    @interface.show_money_win(@comp)
  end

  def human_win
    @human.bank += @game_bank
    @interface.show_money_win(@human)
  end
end
