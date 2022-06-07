require './lib/board'
# rspec spec/board_spec.rb

describe Board do
  subject(:board) { described_class.new }

  describe '#make_board' do
    it 'makes a array length 7' do
      expect(board.grid.length).to eq(7)
    end

    it 'each array value is array length 6' do
      expect(board.grid[1].length).to eq(6)
    end
  end
end
