require 'board'
require 'column'

RSpec.describe Board do
  # describe '#empty?' do

  #   context 'when the board is empty' do
  #     subject(:empty_board) { described_class.new }

  #     it 'should return true' do
  #       result = empty_board.empty?
  #       expect(result).to be true
  #     end

  #   end
  # end

  describe '#place_marker!' do
    context 'when placeing a marker' do
      subject(:place_board) { described_class.new }
      let(:chosen_column) { instance_double(Column) }
      let(:number) { 1 }

      before do
        allow(place_board).to receive(:get_column).with(number).and_return(chosen_column)
        allow(chosen_column).to receive(:drop_marker!)
      end

      it 'should send a message to column' do
         expect(chosen_column).to receive(:drop_marker!)
         place_board.place_marker!('marker1', 1)
      end
    end
  end
end