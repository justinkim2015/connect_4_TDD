class Game
  attr_accessor :board, :turn, :player1, :player2

  def initialize(player1 = Player.new('Player 1', 'y'), player2 = Player.new('Player 2', 'b'), board = Board.new)
    @player1 = player1
    @player2 = player2
    @board = board
    @turn = @player1
  end

  def valid_input?(row)
    row.between?(0, 6)
  end

  def valid?(row)
    if valid_input?(row) && board.row_not_full?(row)
      true
    else
      puts 'ERROR'
      false
    end
  end

  def place_piece(row, piece)
    @board.update_value(row, piece)
  end

  def take_turn
    puts 'Pick a row(0-6)'
    row = gets.chomp.to_i
    row = gets.chomp.to_i until valid?(row)
    place_piece(row, turn.color)
    board.drawboard
    change_turn
  end

  def change_turn
    @turn = if turn == @player1
              @player2
            else
              @player1
            end
  end

  def horizontal_win?(num, row)
    array = []
    array << board.grid[num][row + 1]
    array << board.grid[num][row + 2]
    array << board.grid[num][row + 3]
    array << board.grid[num][row + 4]
    p array
    array.uniq.length == 1
  end
end
