require 'game'
require 'player'
require 'board'

RSpec.describe Game do
  subject(:game) { described_class.new(board, player_1, player_2) }
  let(:board) { instance_double(Board) }
  let(:player_1) { instance_double(Player) }
  let(:player_2) { instance_double(Player) }

  describe '#switch_player!' do
    context 'when the current player is player_1' do
      it 'switches to player_2' do
        expect { game.switch_player! }.to change { game.current_player }.to(player_2)
      end
    end

    context 'when the current player is player_2' do
      before do
        game.switch_player!
      end

      it 'switches to player_1' do
        expect { game.switch_player! }.to change { game.current_player }.to(player_1)
      end
    end
  end

  describe '#choose_slot' do
    subject(:game_loop) { described_class.new(board, player_1, player_2) }

    context 'when player chooses a valid column (1-7)' do
    valid_input = 2

      before do
        allow(player_1).to receive(:choose_column!)
        allow(game_loop).to receive(:gets).and_return(valid_input)
        allow(game_loop).to receive(:puts).with('Choose a column to place your marker (1 - 7)')
      end

      it 'sends a message to current_player' do
        expect(player_1).to receive(:choose_column!).with(valid_input)
        game_loop.choose_slot
      end
    end

    context 'when the player give two wrong inputs, and then a valid one' do
      invalid_input_1 = 'e'
      invalid_input_2 = 9
      valid_input = 7

      before do
        allow(player_1).to receive(:choose_column!)
        allow(game_loop).to receive(:gets).exactly(3).times.and_return(invalid_input_1, invalid_input_2, valid_input)
        allow(game_loop).to receive(:puts).with('Choose a column to place your marker (1 - 7)')
        allow(game_loop).to receive(:puts).with('Please give a value between 1 and 7.').twice
      end

      it 'displays error message twice' do
        expect(game_loop).to receive(:puts).with('Please give a value between 1 and 7.').twice
        game_loop.choose_slot
      end
    end
  end
end
