RSpec.describe Board do
  describe '#empty?' do

    context 'when the board is empty' do
      subject(:empty_board) { described_class.new }

      it 'should return true' do
        result = empty_board.empty?
        expect(result).to be true
      end

    end
  end
end