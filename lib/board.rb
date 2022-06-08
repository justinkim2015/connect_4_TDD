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
    num = -1
    if @grid[num][row] == piece
      loop do
        break if @grid[num][row] != piece

        num -= 1
      end
    end
    @grid[num][row] = piece
  end
end
