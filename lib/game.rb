class Game
  attr_accessor :board

  def initialize(player1 = Player.new('Player 1', 'y'), player2 = Player.new('Player 2', 'b'), board = Board.new)
    @player1 = player1
    @player2 = player2
    @board = board
    @turn = @player1
  end

  def valid_input?(row)
    row.between?(1, 7)
  end

  def update_board(row, piece)
    @board.update_value(row, piece) if valid_input?(row)
  end

  def place_piece(row, piece)
    update_board(row, piece)
  end
end