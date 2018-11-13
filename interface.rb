class Interface
  def greeting
    print 'Как вас зовут?: '
    name = gets.chomp
    puts "Добро пожаловать, #{name}"
    name
  end

  def show_points(someone)
    puts "Внимание! Всего у #{someone.name}: #{someone.count_points} очков"
  end

  def show_player_deal(human)
    show_open_hand(human)
  end

  def show_comp_deal(comp, game_over)
    if game_over
      show_open_hand(comp)
    else
      puts 'У Дилера на руках:'
      comp.hand.size.times { print '* ' }
      puts
    end
  end

  def show_open_hand(someone)
    puts "У #{someone.name} на руках:"
    someone.hand.each { |card| puts "#{card.face} #{card.suit}" }
    show_points(someone)
  end

  def show_player_choice
    puts 'Выберите дальнейшее дейтсвие:'
    puts
    puts '1. - Взять еще карту 2. - Пропустить 3. - Вскрываемся'
    gets.to_i
  end

  def show_dealer_hit
    puts 'Дилер берет еще одну карту'
  end

  def show_dealer_stay
    puts 'Дилер пропускает ход'
  end

  def show_game_results
    puts 'Игра окончена со следующими результатами:'
  end

  def show_bj_win
    puts 'Black Jack!'
  end

  def show_tie
    puts 'Это ничья!'
  end

  def show_lose
    puts 'Перебор! Вы оба проиграли!'
  end

  def show_make_bet
    puts 'Игроки сделали ставки по 10$ в банк'
  end

  def show_banks(human, comp)
    puts 'В распоряжении игроков:'
    puts "Игрок #{human.name}: #{human.bank}$, Дилер: #{comp.bank}$"
  end

  def show_bankrupt
    puts
    puts 'На счету одного из игроков не хватает средств для ставки!'
    puts
  end

  def show_return_bets(human, comp)
    puts 'Ставки возвращены в банки игроков'
    show_banks(human, comp)
  end

  def show_game_win(someone)
    puts "Победил #{someone.name}!"
  end

  def show_money_win(someone)
    puts 'Ставки забирает победитель.'
    puts "В банке победителя #{someone.name}: #{someone.bank}$"
  end

  def show_game_stop
    puts 'Сыграем еще?'
    puts '1. Продолжаем 2. Заканчиваем игру'
    gets.to_i
  end

  def show_game_over
    puts 'Игра закончена'
  end
end
