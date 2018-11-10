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

  def show_player_deal(human)
    puts "У Игрока #{human.name} следующие карты:"
      human.hand.each { |card| puts "#{card.face} #{card.suit}"}
    puts
    show_player_points(human)
  end

  def show_comp_deal(comp)
    puts
    puts "У дилера такие карты:"
    (comp.hand.size).times { print '* ' }
    puts
  end

  def show_player_choice
    puts "Выберите дальнейшее дейтсвие:"
    puts "1. - Взять еще карту 2. - Пропустить 3. - Вскрываемся"
    choice = gets.to_i
  end
end