require './lib/board'
# rspec spec/board_spec.rb

describe Board do
  subject(:board) { described_class.new }

  describe '#make_board' do
    it 'makes a array 6' do
      expect(board.grid.length).to eq(6)
    end

    it 'each array value is array length 7' do
      expect(board.grid[1].length).to eq(7)
    end
  end

  describe '#update_spot' do
    context 'when spot is empty' do
      it 'changes spot' do
        piece = 'y'
        row = 0
        expect { board.update_value(row, piece) }.to change { board.grid[-1][row] }.from(0).to(piece)
      end
    end

    context 'when spot is not empty' do
      it 'changes spot above it' do
        piece = 'y'
        row = 0
        board.grid[-1][row] = piece
        expect { board.update_value(row, piece) }.to change { board.grid[-2][row] }.from(0).to(piece)
      end

      it 'changes spot 2 above it' do
        piece = 'b'
        row = 0
        board.grid[-1][row] = piece
        board.grid[-2][row] = piece
        expect { board.update_value(row, piece) }.to change { board.grid[-3][row] }.from(0).to(piece)
      end

      it 'doesnt replace other players piece' do
        p1_piece = 'y'
        p2_piece = 'b'
        row = 0
        board.grid[-1][row] = p1_piece
        expect { board.update_value(row, p2_piece) }.to_not(change { board.grid[-1][row] })
      end
    end
  end

  describe '#row_not_full?' do
    context 'when row is full' do
      it 'return false' do
        player_color = 'y'
        row = 0
        board.grid[0][0..-1] = player_color
        expect(board.row_not_full?(row)).to eq(false)
      end
    end

    context 'when row isnt full' do
      it 'return true' do
        row = 0
        expect(board.row_not_full?(row)).to eq(true)
      end
    end
  end
end
