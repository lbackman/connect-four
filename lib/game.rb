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

  def choose_slot
    puts 'Choose a column to place your marker (1 - 7)'
    loop do
      column = gets.to_i
      if (1..7).include?(column)
        current_player.choose_column!(column)
        break
      else
        puts 'Please give a value between 1 and 7.'
      end
    end
  end
end