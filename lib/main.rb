require_relative './board'
require_relative './player'
require_relative './game'

game = Game.new
loop do
  game.take_turn
end