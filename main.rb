require_relative 'game'
require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'interface'

interface = Interface.new
game = Game.new(interface)

game.start_game_session
