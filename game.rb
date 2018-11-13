class Game
  attr_reader :human, :comp, :game_over, :bank

  def initialize(interface)
    @current_deck = Deck.new
    @interface = interface
    assign_players(interface)
    @game_over = false
    @game_bank = 0
  end

  def assign_players(interface)
    @human = Player.new(interface.greeting)
    @comp = Player.new
  end

  def start_game_session
    if bankrupt?
      @interface.show_bankrupt(@human, @comp)
      return
    else
      @interface.show_make_bet
      @game_bank = (@human.make_bet + @comp.make_bet)
    end
    first_deal
    black_jack? ? game_result : player_turn
  end

  def bankrupt?
    @human.bank < 10 || @comp.bank < 10
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
      return_bets
      return
    elsif @human.count_points == @comp.count_points
      @interface.show_bj_win if black_jack?
      @interface.show_tie
      return_bets
      return
    else
      choose_winner
    end
  end

  def return_bets
    @human.bank += (@game_bank / 2)
    @comp.bank += (@game_bank / 2)
    @interface.show_return_bets(@human, @comp)
  end

  def choose_winner
    @interface.show_bj_win if black_jack?

    if @human.count_points > 21
      comp_win
    elsif @comp.count_points > 21
      human_win
    elsif @human.count_points > @comp.count_points
      human_win
    else
      comp_win
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
