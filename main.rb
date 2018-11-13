require_relative 'game'
require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'interface'

interface = Interface.new
game = Game.new(interface)

loop do
  game.start_game_session
  return interface.show_bankrupt if game.bankrupt?
  return interface.game_over if interface.show_game_stop == 2
end