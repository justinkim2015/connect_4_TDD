module WinCons
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