require 'pry'

class Board
  attr_accessor :grid

  def initialize
    @grid = make_board
  end

  def make_board
    Array.new(6) { Array.new(7, 0) }
  end

  def drawboard
    @grid.each do |row|
      print '| '
      row.each do |value|
        print "#{value} | "
      end
      puts "\n------------------------------"
    end
  end

  def update_value(row, piece)
    num = find_empty(row)
    @grid[num][row] = piece
  end

  def row_not_full?(row)
    num = -6
    empty = 0
    @grid[num][row] == empty
  end

  def find_empty(row)
    num = -1
    empty = 0
    if @grid[num][row] != empty
      loop do
        break if @grid[num].nil? || @grid[num][row] == empty

        num -= 1
      end
    end
    num
  end
end
