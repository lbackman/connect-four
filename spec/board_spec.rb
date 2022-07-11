require 'board'
# require 'column'

RSpec.describe Board do
  subject(:board) { described_class.new }
  let(:column_1) { instance_double(Column) }
  let(:column_2) { instance_double(Column) }
  let(:column_3) { instance_double(Column) }
  let(:column_4) { instance_double(Column) }
  let(:column_5) { instance_double(Column) }
  let(:column_6) { instance_double(Column) }
  let(:column_7) { instance_double(Column) }

  before(:each) do
    allow(board).to receive(:get_column).with(1).and_return(column_1)
    allow(board).to receive(:get_column).with(2).and_return(column_2)
    allow(board).to receive(:get_column).with(3).and_return(column_3)
    allow(board).to receive(:get_column).with(4).and_return(column_4)
    allow(board).to receive(:get_column).with(5).and_return(column_5)
    allow(board).to receive(:get_column).with(6).and_return(column_6)
    allow(board).to receive(:get_column).with(7).and_return(column_7)
    allow(column_1).to receive(:drop_marker!)
    allow(column_2).to receive(:drop_marker!)
    allow(column_3).to receive(:drop_marker!)
    allow(column_4).to receive(:drop_marker!)
    allow(column_5).to receive(:drop_marker!)
    allow(column_6).to receive(:drop_marker!)
    allow(column_7).to receive(:drop_marker!)
    allow(column_1).to receive(:get_marker).with(1).and_return("\u26aa")
    allow(column_1).to receive(:get_marker).with(2).and_return("  ")
    allow(column_1).to receive(:get_marker).with(3).and_return("  ")
    allow(column_1).to receive(:get_marker).with(4).and_return("  ")
    allow(column_1).to receive(:get_marker).with(5).and_return("  ")
    allow(column_1).to receive(:get_marker).with(6).and_return("  ")
    allow(column_2).to receive(:get_marker).with(1).and_return("  ")
    allow(column_2).to receive(:get_marker).with(2).and_return("  ")
    allow(column_2).to receive(:get_marker).with(3).and_return("  ")
    allow(column_2).to receive(:get_marker).with(4).and_return("  ")
    allow(column_2).to receive(:get_marker).with(5).and_return("  ")
    allow(column_2).to receive(:get_marker).with(6).and_return("  ")
    allow(column_3).to receive(:get_marker).with(1).and_return("  ")
    allow(column_3).to receive(:get_marker).with(2).and_return("  ")
    allow(column_3).to receive(:get_marker).with(3).and_return("  ")
    allow(column_3).to receive(:get_marker).with(4).and_return("  ")
    allow(column_3).to receive(:get_marker).with(5).and_return("  ")
    allow(column_3).to receive(:get_marker).with(6).and_return("  ")
    allow(column_4).to receive(:get_marker).with(1).and_return("  ")
    allow(column_4).to receive(:get_marker).with(2).and_return("  ")
    allow(column_4).to receive(:get_marker).with(3).and_return("  ")
    allow(column_4).to receive(:get_marker).with(4).and_return("  ")
    allow(column_4).to receive(:get_marker).with(5).and_return("  ")
    allow(column_4).to receive(:get_marker).with(6).and_return("  ")
    allow(column_5).to receive(:get_marker).with(1).and_return("\u26ab")
    allow(column_5).to receive(:get_marker).with(2).and_return("\u26ab")
    allow(column_5).to receive(:get_marker).with(3).and_return("  ")
    allow(column_5).to receive(:get_marker).with(4).and_return("  ")
    allow(column_5).to receive(:get_marker).with(5).and_return("  ")
    allow(column_5).to receive(:get_marker).with(6).and_return("  ")
    allow(column_6).to receive(:get_marker).with(1).and_return("  ")
    allow(column_6).to receive(:get_marker).with(2).and_return("  ")
    allow(column_6).to receive(:get_marker).with(3).and_return("  ")
    allow(column_6).to receive(:get_marker).with(4).and_return("  ")
    allow(column_6).to receive(:get_marker).with(5).and_return("  ")
    allow(column_6).to receive(:get_marker).with(6).and_return("  ")
    allow(column_7).to receive(:get_marker).with(1).and_return("  ")
    allow(column_7).to receive(:get_marker).with(2).and_return("  ")
    allow(column_7).to receive(:get_marker).with(3).and_return("  ")
    allow(column_7).to receive(:get_marker).with(4).and_return("  ")
    allow(column_7).to receive(:get_marker).with(5).and_return("  ")
    allow(column_7).to receive(:get_marker).with(6).and_return("  ")
  end

  describe '#place_marker!' do
    context 'when placing a marker' do

      it 'should send a message to column' do
         expect(column_1).to receive(:drop_marker!)
         board.place_marker!('marker1', 1)
      end
    end
  end

  describe '#row' do

    before do
      board.place_marker!("\u26aa", 1)
      board.place_marker!("\u26aa", 5)
      board.place_marker!("\u26ab", 5)
    end

    it 'the sixth (highest) row should be empty' do
      row_6 = board.row(6)
      expect(row_6).to eq("              ")
    end

    it 'the second row should have a black circle in the fifth column' do
      row_2 = board.row(2)
      expect(row_2).to eq("        \u26ab    ")
    end

    it 'the first row should have a white circle in the 1st and 5th column' do
      row_1 = board.row(1)
      expect(row_1).to eq("\u26aa      \u26ab    ")
    end
  end


  describe '#current_board' do

    it 'should return the state of the board' do

      expect(board.current_board).to eq(
        "              " + "\n" +
        "              " + "\n" +
        "              " + "\n" +
        "              " + "\n" +
        "        \u26ab    " + "\n" +
        "\u26aa      \u26ab    ")
    end
  end
end
