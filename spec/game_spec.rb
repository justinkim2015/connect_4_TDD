require './lib/game'
require './lib/board'
require './lib/player'
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
    allow(board).to receive(:update_value)
  end

  describe '#choose_column' do
  end

  describe '#update_value' do
    context 'when spot is valid' do
      it 'sends update_value to board' do
        valid_num = 4
        piece = 'y'
        expect(board).to receive(:update_value).with(valid_num, piece)
        game.update_board(valid_num, piece)
      end
    end

    context 'when spot is invalid' do
      it 'doesnt send update_value to board' do
        invalid_num = 40
        piece = 'y'
        expect(board).not_to receive(:update_value).with(invalid_num, piece)
        game.update_board(invalid_num, piece)
      end
    end
  end

  describe '#valid_input?' do
    context 'when number is valid' do
      it 'returns true' do
        valid_num = 4
        expect(game.valid_input?(valid_num)).to be true
      end
    end

    context 'when number is invalid' do
      it 'returns false' do
        invalid_num = 45
        expect(game.valid_input?(invalid_num)).to be false
      end
    end
  end

  describe '#place_piece' do
    context 'when move is valid' do
      it 'sends message to board' do
        row = 0
        piece = player1.color
        game.place_piece(row, piece)
        expect(game.board).to receive(:update_value)
      end
    end

    context 'when move is invalid' do
      xit 'returns an error message' do
      end
    end
  end
end
