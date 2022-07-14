require 'marker'

class Player
  attr_reader :board, :marker
  def initialize(board, number = 1)
    @board = board
    @number = number
    @marker = Marker.for(number)
  end

  def choose_column!(column)
    board.place_marker!(marker, column)
  end

  def player_win?
    board.win?(marker)
  end
end
