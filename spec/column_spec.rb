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

    it 'sets the value at [6] to marker6' do
      6.times { |i| column.drop_marker!("marker#{i + 1}")}
      expect(column[6]).to eq('marker6')
    end

    it 'does not drop any more markers after 6' do
      7.times { |i| column.drop_marker!("marker#{i + 1}")}
      expect(column[7]).to eq('  ')
    end
  end
end