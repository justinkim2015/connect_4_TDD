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
end
