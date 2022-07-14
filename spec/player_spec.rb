require 'player'
require 'marker'

describe Player do
  let(:board) { double('board') }
  let(:marker) { double('Marker') }
  let(:column) { 2 }
  subject(:player_1) { described_class.new(board, 1) }

  describe '#choose_column!' do

    context 'when the chosen column has empty slots' do

      before do
        allow(board).to receive(:place_marker!).with(marker, column)
        allow(player_1).to receive(:marker).and_return(marker)
      end

      it 'the player can place their marker' do
        expect(board).to receive(:place_marker!).with(marker, column)
        player_1.choose_column!(column)
      end
    end
  end

  describe '#player_win?' do

    before do
      allow(board).to receive(:win?).with(marker)
      allow(player_1).to receive(:marker).and_return(marker)
    end

    it 'a message should be sent to board' do
      expect(board).to receive(:win?).with(marker)
      player_1.player_win?
    end
  end
end