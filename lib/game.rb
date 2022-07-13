class Game
  attr_reader :board, :current_player, :next_player
  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @next_player = @player_2
  end

  def switch_player!
    @current_player, @next_player = @next_player, @current_player
  end
end