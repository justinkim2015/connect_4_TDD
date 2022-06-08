class Game
  attr_accessor :board

  def initialize(player1 = Player.new('Player 1', 'y'), player2 = Player.new('Player 2', 'b'), board = Board.new)
    @player1 = player1
    @player2 = player2
    @board = board
    @turn = @player1
  end

  def valid?(num)
    num.between?(1, 7)
  end

  def update_value(num)
    # @board.update_value(num)
    # @board.drawboard
  end
end