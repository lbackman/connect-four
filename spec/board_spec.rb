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

  before do
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
    allow(column_2).to receive(:get_marker).with(1).and_return("\u26aa")
    allow(column_2).to receive(:get_marker).with(2).and_return("\u26aa")
    allow(column_2).to receive(:get_marker).with(3).and_return("\u26aa")
    allow(column_2).to receive(:get_marker).with(4).and_return("\u26aa")
    allow(column_2).to receive(:get_marker).with(5).and_return("  ")
    allow(column_2).to receive(:get_marker).with(6).and_return("  ")
    allow(column_3).to receive(:get_marker).with(1).and_return("\u26ab")
    allow(column_3).to receive(:get_marker).with(2).and_return("\u26ab")
    allow(column_3).to receive(:get_marker).with(3).and_return("\u26aa")
    allow(column_3).to receive(:get_marker).with(4).and_return("\u26ab")
    allow(column_3).to receive(:get_marker).with(5).and_return("  ")
    allow(column_3).to receive(:get_marker).with(6).and_return("  ")
    allow(column_4).to receive(:get_marker).with(1).and_return("\u26ab")
    allow(column_4).to receive(:get_marker).with(2).and_return("\u26ab")
    allow(column_4).to receive(:get_marker).with(3).and_return("\u26ab")
    allow(column_4).to receive(:get_marker).with(4).and_return("\u26aa")
    allow(column_4).to receive(:get_marker).with(5).and_return("  ")
    allow(column_4).to receive(:get_marker).with(6).and_return("  ")
    allow(column_5).to receive(:get_marker).with(1).and_return("\u26ab")
    allow(column_5).to receive(:get_marker).with(2).and_return("\u26ab")
    allow(column_5).to receive(:get_marker).with(3).and_return("  ")
    allow(column_5).to receive(:get_marker).with(4).and_return("  ")
    allow(column_5).to receive(:get_marker).with(5).and_return("  ")
    allow(column_5).to receive(:get_marker).with(6).and_return("  ")
    allow(column_6).to receive(:get_marker).with(1).and_return("\u26ab")
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
      before do
        allow(column_2).to receive(:drop_marker!).and_return(true)
      end

      it 'should send a message to column' do
         expect(column_1).to receive(:drop_marker!)
         board.place_marker!('marker1', 1)
      end

      it 'should return true' do
        return_value = board.place_marker!('marker1', 2)
        expect(return_value).to eq(true)
      end
    end
  end

  describe '#full?' do
    context 'when the board is not full' do
      subject(:board_not_full) { described_class.new }
      let(:column_1) { instance_double(Column, slots_used: 1) }
      let(:column_2) { instance_double(Column, slots_used: 6) }
      let(:column_3) { instance_double(Column, slots_used: 3) }
      let(:column_4) { instance_double(Column, slots_used: 5) }
      let(:column_5) { instance_double(Column, slots_used: 0) }
      let(:column_6) { instance_double(Column, slots_used: 2) }
      let(:column_7) { instance_double(Column, slots_used: 6) }

      before do
        allow(board_not_full).to receive(:get_column).with(1).and_return(column_1)
        allow(board_not_full).to receive(:get_column).with(2).and_return(column_2)
        allow(board_not_full).to receive(:get_column).with(3).and_return(column_3)
        allow(board_not_full).to receive(:get_column).with(4).and_return(column_4)
        allow(board_not_full).to receive(:get_column).with(5).and_return(column_5)
        allow(board_not_full).to receive(:get_column).with(6).and_return(column_6)
        allow(board_not_full).to receive(:get_column).with(7).and_return(column_7)
      end

      it 'returns false' do
        expect(board_not_full.full?).to eq(false)
      end
    end

    context 'when the board is full' do
      subject(:board_full) { described_class.new }
      let(:column_1) { instance_double(Column, slots_used: 6) }
      let(:column_2) { instance_double(Column, slots_used: 6) }
      let(:column_3) { instance_double(Column, slots_used: 6) }
      let(:column_4) { instance_double(Column, slots_used: 6) }
      let(:column_5) { instance_double(Column, slots_used: 6) }
      let(:column_6) { instance_double(Column, slots_used: 6) }
      let(:column_7) { instance_double(Column, slots_used: 6) }

      before do
        allow(board_full).to receive(:get_column).with(1).and_return(column_1)
        allow(board_full).to receive(:get_column).with(2).and_return(column_2)
        allow(board_full).to receive(:get_column).with(3).and_return(column_3)
        allow(board_full).to receive(:get_column).with(4).and_return(column_4)
        allow(board_full).to receive(:get_column).with(5).and_return(column_5)
        allow(board_full).to receive(:get_column).with(6).and_return(column_6)
        allow(board_full).to receive(:get_column).with(7).and_return(column_7)
      end
      
      it 'returns true' do
        expect(board_full.full?).to eq(true)
      end
    end
  end

  describe '#row' do

    it 'the 6th (highest) row should be empty' do
      row_6 = board.row(6)
      expect(row_6).to eq("\t|    |    |    |    |    |    |    |")
    end

    it 'the 2nd row should have a white circle in the 2nd column and a black in the 5th' do
      row_2 = board.row(2)
      expect(row_2).to eq("\t|    | \u26aa | \u26ab | \u26ab | \u26ab |    |    |")
    end

    it 'the 1st row should have 2 white circles and four black' do
      row_1 = board.row(1)
      expect(row_1).to eq("\t| \u26aa | \u26aa | \u26ab | \u26ab | \u26ab | \u26ab |    |")
    end
  end

  describe '#current_board' do
    it 'should return the state of the board' do
      expect(board.current_board).to eq(
        "\n" +
        "\t|    |    |    |    |    |    |    |" + "\n" +
        "\t+----+----+----+----+----+----+----+" + "\n" +
        "\t|    |    |    |    |    |    |    |" + "\n" +
        "\t+----+----+----+----+----+----+----+" + "\n" +
        "\t|    | \u26aa | \u26ab | \u26aa |    |    |    |" + "\n" +
        "\t+----+----+----+----+----+----+----+" + "\n" +
        "\t|    | \u26aa | \u26aa | \u26ab |    |    |    |" + "\n" +
        "\t+----+----+----+----+----+----+----+" + "\n" +
        "\t|    | \u26aa | \u26ab | \u26ab | \u26ab |    |    |" + "\n" +
        "\t+----+----+----+----+----+----+----+" + "\n" +
        "\t| \u26aa | \u26aa | \u26ab | \u26ab | \u26ab | \u26ab |    |" + "\n" +
        "\t+----+----+----+----+----+----+----+" + "\n" +
        "\t  1    2    3    4    5    6    7   " + "\n\n")
    end
  end

  describe '#column_win?' do
    it 'should return false if there are not 4 of the same marker in a row in the column' do
      expect(board.column_win?(1, "\u26aa")).to eq(false)
    end

    it 'should return true for column 2' do
      expect(board.column_win?(2, "\u26aa")).to eq(true)
    end
  end

  describe '#any_column_win?' do
    it 'should return true for player 1' do
      expect(board.any_column_win?("\u26aa")).to eq(true)
    end

    it 'should return false for player 2' do
      expect(board.any_column_win?("\u26ab")).to eq(false)
    end
  end

  describe '#row_win?' do
    it 'should return false if there are not 4 of the same marker in a row in the row' do
      expect(board.row_win?(2, "\u26aa")).to eq(false)
    end

    it 'should return true for row 1' do
      expect(board.row_win?(1, "\u26ab"))
    end
  end

  describe '#any_row_win?' do
    it 'should return false for player 1' do
      expect(board.any_row_win?("\u26aa")).to eq(false)
    end

    it 'should return true for player 2' do
      expect(board.any_row_win?("\u26ab")).to eq(true)
    end
  end

  describe '#diagonal_ascending_win?' do
    it 'should return false when no diagonal win' do
      expect(board.diagonal_ascending_win?(1, 3, "\u26aa")).to eq(false)
    end

    it 'should be true when there is a winning diagonal' do
      expect(board.diagonal_ascending_win?(1, 1, "\u26aa")).to eq(true)
    end

    it 'should return false when the wrong marker is checked' do
      expect(board.diagonal_ascending_win?(1, 1, "\u26ab")).to eq(false)
    end
  end

  describe '#any_ascending_win?' do
    it 'should return true for player 1' do
      expect(board.any_ascending_win?("\u26aa")).to eq(true)
    end

    it 'should return false for player 2' do
      expect(board.any_ascending_win?("\u26ab")).to eq(false)
    end
  end

  describe '#diagonal_descending_win?' do
    it 'should return false when no diagonal win' do
      expect(board.diagonal_descending_win?(2, 4, "\u26ab")).to eq(false)
    end

    it 'should be true when there is a winning diagonal' do
      expect(board.diagonal_descending_win?(3, 4, "\u26ab")).to eq(true)
    end

    it 'should return false when the wrong marker is checked' do
      expect(board.diagonal_descending_win?(3, 4, "\u26aa")).to eq(false)
    end
  end

  describe '#any_descending_win' do
    it 'should return false for player 1' do
      expect(board.any_descending_win?("\u26aa")).to eq(false)
    end

    it 'should return true for player 2' do
      expect(board.any_descending_win?("\u26ab")).to eq(true)
    end
  end

  describe '#win?' do
    it 'should return true for player 1' do
      expect(board.win?("\u26aa")).to eq(true)
    end

    it 'should return true for player 2' do
      expect(board.win?("\u26ab")).to eq(true)
    end
  end
end
