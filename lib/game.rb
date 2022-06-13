require_relative './win_cons'
require 'colorize'

class Game
  include WinCons

  attr_accessor :board, :turn, :player1, :player2

  def initialize(player1 = Player.new('Player 1', 'y'.colorize(:yellow)),
                 player2 = Player.new('Player 2', 'b'.colorize(:blue)),
                 board = Board.new)
    @player1 = player1
    @player2 = player2
    @board = board
    @turn = @player1
  end

  def filter_input(row)
    valid_inputs = %w[0 1 2 3 4 5 6]
    valid_inputs.include?(row) ? row.to_i : 7
  end

  def valid_number?(row)
    row.between?(0, 6)
  end

  def valid?(row)
    if valid_number?(row) && board.row_not_full?(row)
      true
    else
      puts 'Sorry, that\'s not a valid move, please try again!'.colorize(:red)
      false
    end
  end

  def place_piece(row, piece)
    @board.update_value(row, piece)
  end

  def take_turn
    puts 'Pick a row(0-6)'
    row = filter_input(gets.chomp)
    row = filter_input(gets.chomp) until valid?(row)
    place_piece(row, turn.color)
    board.drawboard
    # find_empty returns the space above the spot im looking for therefore + 1
    return true if winner?(board.find_empty(row) + 1, row)

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

  def play_game
    loop do
      puts "It's #{turn.name}'s turn!"
      if take_turn == true
        puts "#{turn.name} is the winner!"
        break
      end
    end
  end
end
