require './lib/game'
# rspec spec/game_spec.rb

describe Game do
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  let(:board) { double('board') }
  subject(:game) { described_class.new(player1, player2, board) }

  before do
    allow(player1).to receive(:color) { 'y' }
    allow(player2).to receive(:color) { 'b' }
    allow(board).to receive(:grid) { Array.new(6) { Array.new(7, 0) } }
  end

  describe '#choose_column' do
  end

  describe '#update_value' do
    context 'when spot is empty' do
      it 'changes spots value to player color' do
        num = 0
        expect { game.update_value(num) }.to change { game.board.grid[5][num] }.from(0).to('y')
      end
    end
  end

  describe '#valid?' do
    context 'when number is valid' do
      it 'returns true' do
        valid_num = 4
        expect(game.valid?(valid_num)).to be true
      end
    end

    context 'when number is invalid' do
      it 'returns false' do
        invalid_num = 45
        expect(game.valid?(invalid_num)).to be false
      end
    end
  end
end
