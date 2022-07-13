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
end
