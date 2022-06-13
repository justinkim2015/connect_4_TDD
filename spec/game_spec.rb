require './lib/game'
require './lib/board'
require './lib/player'
# rspec spec/game_spec.rb

describe Game do
  subject(:game) { described_class.new(player1, player2, board) }
  let(:player1) { double(Player) }
  let(:player2) { double(Player) }
  let(:board) { double(Board) }

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

  describe '#winner?' do
    context 'when a winning condition is met' do
      it 'returns true' do
        num = -6
        row = 0
        allow(board).to receive(:grid) {
          [[['y'], ['y'], ['y'], ['y'], ['y'], ['y'], ['y']],
           [['y'], ['y'], [0], [0], [0], [0], [0]],
           [['y'], [0], [0], [0], [0], [0], [0]],
           [['y'], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]]]
        }
        expect(game.winner?(num, row)).to be true
      end
    end

    context 'when a winning condition isnt met' do
      it 'returns false' do
        num = -6
        row = 0
        expect(game.winner?(num, row)).to be nil
      end
    end
  end

  describe '#horizontal_win_right?' do
    context 'when at least 4 spaces in a row are the same value' do
      it 'returns true' do
        num = -6
        row = 0
        allow(board).to receive(:grid) {
          [[['y'], ['y'], ['y'], ['y'], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]]]
        }
        expect(game.horizontal_win_right?(num, row)).to be true
      end
    end

    context 'when at least 4 spaces in a row arent the same value' do
      it 'returns false' do
        num = -1
        row = 6
        expect(game.horizontal_win_right?(num, row)).to be false
      end
    end
  end

  describe '#horizontal_win_left?' do
    context 'when at least 4 spaces in a row are the same value' do
      it 'returns true' do
        num = -6
        row = 6
        allow(board).to receive(:grid) {
          [[[0], [0], [0], ['y'], ['y'], ['y'], ['y']],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]]]
        }
        expect(game.horizontal_win_left?(num, row)).to be true 
      end
    end

    context 'when at least 4 spaces in a row arent the same value' do
      it 'returns false' do
        num = -6
        row = 5
        expect(game.horizontal_win_left?(num, row)).to be false
      end
    end
  end

  describe '#vertical_win_down?' do
    context 'when at least 4 spaces in a row are the same value' do
      it 'returns true' do
        num = -6
        row = 0
        allow(board).to receive(:grid) {
          [[['y'], [0], [0], ['y'], ['y'], ['y'], ['y']],
           [['y'], [0], [0], [0], [0], [0], [0]],
           [['y'], [0], [0], [0], [0], [0], [0]],
           [['y'], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]]]
        }
        expect(game.vertical_win_down?(num, row)).to be true
      end
    end

    context 'when at least 4 spaces in a row arent the same value' do
      it 'returns false' do
        num = -1
        row = 6
        expect(game.vertical_win_down?(num, row)).to be false
      end
    end
  end

  describe '#vertical_win_up?' do
    context 'when at least 4 spaces in a row are the same value' do
      it 'returns true' do
        num = -3
        row = 0
        allow(board).to receive(:grid) {
          [[['y'], [0], [0], ['y'], ['y'], ['y'], ['y']],
           [['y'], [0], [0], [0], [0], [0], [0]],
           [['y'], [0], [0], [0], [0], [0], [0]],
           [['y'], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]]]
        }
        expect(game.vertical_win_up?(num, row)).to be true
      end
    end

    context 'when at least 4 spaces in a row arent the same value' do
      it 'returns false' do
        num = -3
        row = 0
        expect(game.vertical_win_up?(num, row)).to be false
      end
    end
  end

  describe '#ur_win?' do
    context 'when at least 4 spaces in a row are the same value' do
      it 'returns true' do
        num = -1
        row = 0
        allow(board).to receive(:grid) {
          [[[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], ['y'], [0], [0], [0]],
           [[0], [0], ['y'], [0], [0], [0], [0]],
           [[0], ['y'], [0], [0], [0], [0], [0]],
           [['y'], [0], [0], [0], [0], [0], [0]]]
        }
        expect(game.ur_win?(num, row)).to be true
      end
    end

    context 'when at least 4 spaces in a row arent the same value' do
      it 'returns false' do
        num = -1
        row = 0
        expect(game.ur_win?(num, row)).to be false
      end
    end

    describe 'bl_win?' do
      context 'when at least 4 spaces in a row are the same value' do
        it 'returns true' do
          num = -4
          row = 3
          allow(board).to receive(:grid) {
            [[[0], [0], [0], [0], [0], [0], [0]],
             [[0], [0], [0], [0], [0], [0], [0]],
             [[0], [0], [0], ['y'], [0], [0], [0]],
             [[0], [0], ['y'], [0], [0], [0], [0]],
             [[0], ['y'], [0], [0], [0], [0], [0]],
             [['y'], [0], [0], [0], [0], [0], [0]]]
          }
          expect(game.bl_win?(num, row)).to be true
        end
      end

      context 'when at least 4 spaces in a row arent the same value' do
        it 'returns false' do
          num = -1
          row = 6
          expect(game.bl_win?(num, row)).to be false
        end
      end
    end
  end

  describe 'ul_win?' do
    context 'when at least 4 spaces in a row are the same value' do
      it 'returns true' do
        num = -3
        row = 3
        allow(board).to receive(:grid) {
          [[['y'], [0], [0], [0], [0], [0], [0]],
           [[0], ['y'], [0], [0], [0], [0], [0]],
           [['y'], [0], ['y'], [0], [0], [0], [0]],
           [[0], ['y'], [0], ['y'], [0], [0], [0]],
           [[0], [0], ['y'], [0], [0], [0], [0]],
           [[0], [0], [0], ['y'], [0], [0], [0]]]
        }
        expect(game.ul_win?(num, row)).to be true
      end
    end

    context 'when at least 4 spaces in a row arent the same value' do
      it 'returns false' do
        num = -1
        row = 6
        expect(game.ul_win?(num, row)).to be false
      end
    end
  end

  describe 'br_win?' do
    context 'when at least 4 spaces in a row are the same value' do
      it 'returns true' do
        num = -4
        row = 3
        allow(board).to receive(:grid) {
          [[[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], [0], [0], [0], [0]],
           [[0], [0], [0], ['y'], [0], [0], [0]],
           [[0], [0], [0], [0], ['y'], [0], [0]],
           [[0], [0], [0], [0], [0], ['y'], [0]],
           [[0], [0], [0], [0], [0], [0], ['y']]]
        }
        expect(game.br_win?(num, row)).to be true
      end
    end

    context 'when at least 4 spaces in a row arent the same value' do
      it 'returns false' do
        num = -1
        row = 6
        expect(game.br_win?(num, row)).to be false
      end
    end
  end
end
