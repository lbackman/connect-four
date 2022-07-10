require 'marker'

RSpec.describe Marker do
  describe '#to_s' do
    it 'returns the correct marker when initialized with 1' do
      marker_1 = Marker.for(1)
      expect(marker_1.to_s).to eq("\u26aa")
    end

    it 'returns the correct marker when initialized with 2' do
      marker_2 = Marker.for(2)
      expect("#{marker_2}").to eq("\u26ab")
    end
  end
end
