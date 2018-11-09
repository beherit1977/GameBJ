require_relative 'game'
require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'interface'

interface = Interface.new
game = Game.new

# последовательно вызываем методы класса игра, дальше будет цикл и проверки очков
game.assign_players(interface)
game.first_deal(interface)
