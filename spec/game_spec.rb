require './lib/game'
require './lib/board'
require './lib/player'
# rspec spec/game_spec.rb

describe Game do
  subject(:game) { described_class.new(player1, player2, board) }
  let(:player1) { double(Player) }
  let(:player2) { double(Player) }
  let(:board) { double(Board) }
  # These ^^^ were previously 'player' and 'board'?

  before do
    allow(player1).to receive(:color) { 'y' }
    allow(player2).to receive(:color) { 'b' }
    allow(board).to receive(:grid) { Array.new(6) { Array.new(7, 0) } }
  end

  describe '#choose_column' do
  end

  describe '#valid_input?' do
    context 'when row number is valid' do
      it 'returns true' do
        valid_num = 4
        expect(game.valid_input?(valid_num)).to be true
      end
    end

    context 'when row number is invalid' do
      it 'returns false' do
        invalid_num = 45
        expect(game.valid_input?(invalid_num)).to be false
      end
    end
  end

  describe '#place_piece' do
    it 'sends message to board' do
      row = 7
      piece = player1.color
      expect(board).to receive(:update_value)
      game.place_piece(row, piece)
    end
  end

  describe '#change_turn' do
    context 'when its players X turn' do
      it 'changes to player Y turn' do
        expect { game.change_turn }.to change { game.turn }.from(player1).to(player2)
      end

      it 'vice-versa' do
        game.turn = player2
        expect { game.change_turn }.to change { game.turn }.from(player2).to(player1)
      end
    end
  end
end
