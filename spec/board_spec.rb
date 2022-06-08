require './lib/board'
# rspec spec/board_spec.rb

describe Board do
  subject(:board) { described_class.new }

  describe '#make_board' do
    it 'makes a array length 6' do
      expect(board.grid.length).to eq(6)
    end

    it 'each array value is array length 7' do
      expect(board.grid[1].length).to eq(7)
    end
  end

  describe '#update_spot' do
    context 'when spot is empty' do
      it 'changes spot' do
        player_color = 'y'
        row = 0
        expect { board.update_value(row, player_color) }.to change { board.grid[-1][row] }.from(0).to(player_color)
      end
    end

    context 'when spot is not empty' do
      it 'changes spot above it' do
        player_color = 'y'
        row = 0
        board.grid[-1][row] = 'y'
        expect { board.update_value(row, player_color) }.to change { board.grid[-2][row] }.from(0).to(player_color)
      end

      it 'changes spot 2 above it' do
        player_color = 'y'
        row = 0
        board.grid[-1][row] = 'y'
        board.grid[-2][row] = 'y'
        expect { board.update_value(row, player_color) }.to change { board.grid[-3][row] }.from(0).to(player_color)
      end
    end
  end
end
