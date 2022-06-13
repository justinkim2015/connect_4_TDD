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
    puts 'WINNER' if winner?(board.find_empty(row) + 1, row)
    # find_empty returns the space above the spot im looking for therefore + 1
    change_turn
  end

  def change_turn
    @turn = if turn == @player1
              @player2
            else
              @player1
            end
  end

  def winner?(num, row)
    return true if horizontal_win_right?(num, row) ||
                   horizontal_win_left?(num, row) ||
                   vertical_win_down?(num, row) ||
                   vertical_win_up?(num, row) ||
                   ul_win?(num, row) ||
                   ur_win?(num, row) ||
                   bl_win?(num, row) ||
                   br_win?(num, row)
  end

  def horizontal_win_right?(num, row)
    array = []
    i = 0
    4.times do
      array << board.grid[num][row + i]
      i += 1
    end
    win_con(array)
  end

  def horizontal_win_left?(num, row)
    array = []
    i = 0
    4.times do
      array << ((row - i).negative? ? nil : board.grid[num][row - i])
      i += 1
    end
    win_con(array)
  end

  def vertical_win_down?(num, row)
    array = []
    i = 0
    4.times do
      array << (board.grid[num + i].nil? ? nil : board.grid[num + i][row])
      i += 1
    end
    win_con(array)
  end

  def vertical_win_up?(num, row)
    array = []
    i = 0
    4.times do 
      array << (board.grid[num - i].nil? ? nil : board.grid[num - i][row])
      i += 1
    end
    win_con(array)
  end

  def ur_win?(num, row)
    array = []
    i = 0
    4.times do
      array << (board.grid[num - i].nil? ? nil : board.grid[num - i][row + i])
      i += 1
    end
    win_con(array)
  end

  def bl_win?(num, row)
    array = []
    i = 0
    4.times do
      array << (board.grid[num + i].nil? ? nil : board.grid[num + i][row - i])
      i += 1
    end
    win_con(array)
  end

  def ul_win?(num, row)
    array = []
    i = 0
    4.times do
      array << if board.grid[num - i].nil? || board.grid[row - i].nil?
                 nil
               else
                 board.grid[num - i][row - i]
               end
      i += 1
    end
    win_con(array)
  end

  def br_win?(num, row)
    array = []
    i = 0
    4.times do
      array << (board.grid[num + i].nil? ? nil : board.grid[num + i][row + i])
      i += 1
    end
    win_con(array)
  end

  def win_con(array)
    start_value = 0
    if array.uniq.length == 1 && array.uniq != [start_value] && array.uniq != [nil]
      true
    else
      false
    end
  end
end
