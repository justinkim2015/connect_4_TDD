require_relative './board'
require_relative './player'
require_relative './game'

game = Game.new
game.board.grid[5][0] = 'y'
game.board.grid[4][0] = 'y'
game.board.grid[3][0] = 'y'
game.board.grid[2][0] = 'y'
game.board.grid[1][0] = 'y'
loop do
  game.take_turn
end