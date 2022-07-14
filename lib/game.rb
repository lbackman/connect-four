class Game
  attr_reader :board, :current_player, :next_player
  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @next_player = @player_2
  end

  def introduction
    puts <<~HEREDOC

      Hi and welcome to connect-four; the game where the first player to place
      four of their markers in a row wins.

      The game board has 7 columns and 6 rows. You drop a marker by pressing on
      the number 1 to 7 on your keyboard.

      #{@player_1} has white markers and #{@player_2} has black markers.

      #{current_player} goes first. Good luck!

    HEREDOC
  end

  def print_board
    puts board.current_board
  end

  def switch_player!
    @current_player, @next_player = @next_player, @current_player
  end

  def choose_slot
    puts "#{current_player}, choose a column to place your marker (1 - 7)"
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

  def game_over?
    current_player.player_win? || board.full?
  end

  def game_over_message
    if current_player.player_win?
      puts "#{current_player} won the game!"
    else
      puts "It's a draw."
    end
  end
end