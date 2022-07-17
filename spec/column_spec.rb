require 'column'

describe Column do
  subject(:column) { described_class.new }

  describe '#[] / #get_marker' do
    # let(:marker) { double('marker') }

    before do
      allow(column).to receive(:[]).with(1).and_return 'marker'
    end

    it 'gets the marker at symbol string representation [1]' do
      expect(column[1]).to eq('marker')
    end
  end

  describe 'drop_marker!' do
    # let(:marker) { double('marker') }

    it 'sets the value at [2] to marker2' do
      column.drop_marker!('marker1')
      column.drop_marker!('marker2')
      expect(column[2]).to eq('marker2')
    end

    it 'returns true when the column is not full' do
      column.drop_marker!('marker1')
      return_value = column.drop_marker!('marker1')
      expect(return_value).to eq(true)
    end
    context 'the column is filled' do

      before do
        6.times { |i| column.drop_marker!("marker#{i + 1}")}
        allow(column).to receive(:puts)
        allow(column).to receive(:sleep).with(1.5)
      end

      it 'sets the value at [6] to marker6' do
        expect(column[6]).to eq('marker6')
      end

      it 'does not drop any more markers after 6' do
        column.drop_marker!('marker7')
        expect(column[7]).to eq('  ')
      end

      it 'returns false when the column is full' do
        return_value = column.drop_marker!('marker7')
        expect(return_value).to eq(false)
      end
    end
  end
end