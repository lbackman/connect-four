require 'marker'

class Player
  attr_reader :board, :marker
  def initialize(board, number = 1)
    @board = board
    @number = number
    @marker = Marker.for(number)
  end

  def self.for(board, number)
    case number
    when 1
      Player1
    when 2
      Player2
    end.new(board, number)
  end

  def choose_column!(column)
    board.place_marker!(marker, column)
  end
end

class Player1 < Player
end
