class Interface
  def greeting
   print 'Как вас зовут?: '
   name = gets.chomp
   puts "Добро пожаловать, #{name}"
   name
  end

  def show_player_points(human)
    puts "Внимание! Всего у Вас #{human.count_points} очков"
  end

  def show_dealer_points(comp)
    puts "Внимание! У Дилера #{comp.count_points} очков"
  end

  def show_player_deal(human)
    puts "У Игрока #{human.name} на руках:"
      human.hand.each { |card| puts "#{card.face} #{card.suit}"}
    puts
    show_player_points(human)
  end

  def show_comp_deal(comp, game_over)
    if game_over
      puts "У Дилера на руках:"
      comp.hand.each { |card| puts "#{card.face} #{card.suit}"}
      puts
      show_dealer_points(comp)
    else
      puts
      puts "У Дилера на руках:"
      puts
      (comp.hand.size).times { print '* ' }
      puts
    end
  end

  def show_player_choice
    puts "Выберите дальнейшее дейтсвие:"
    puts "1. - Взять еще карту 2. - Пропустить 3. - Вскрываемся"
    choice = gets.to_i
  end

  def show_dealer_hit
    puts
    puts "Дилер берет еще одну карту"
    puts
  end

  def show_dealer_stay
    puts
    puts "Дилер пропускает ход"
    puts
  end

  def show_game_over
    puts
    puts "Игра окончена со следующими результатами:"
    puts
  end

  def show_bj_win
    puts
    puts "Black Jack!"
    puts
  end

  def show_human_win(human)
    puts
    puts "Победил игрок #{human.name} с #{human.count_points} очками!"
    puts
  end

  def show_comp_win(comp)
    puts
    puts "Победил Дилер с #{comp.count_points} очками!"
    puts
  end

  def show_tie
    puts
    puts "Это ничья!"
    puts
  end

  def show_lose
    puts
    puts "Перебор! Вы оба проиграли!"
    puts
  end
end