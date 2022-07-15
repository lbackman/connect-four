require_relative 'board'
require_relative 'player'

require 'pry-byebug'

class Game
  attr_reader :board, :current_player, :next_player
  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @next_player = @player_2
  end

  def play
    system('clear')
    introduction
    print_board
    loop do
      board_changed = choose_slot!
      print_board
      break if game_over?

      switch_player! if board_changed
    end
    game_over_message
  end

  private

  def introduction
    puts <<~HEREDOC

      Hi and welcome to Connect-Four; the game where the first player to place
            four consecutive markers in a row, column or diagonal, wins.

      The game board has 7 columns and 6 rows. You drop a marker by pressing on
                    the numbers 1 through 7 on your keyboard.

            #{@player_1} has white markers and #{@player_2} has black markers.

                        #{current_player} goes first. Good luck!
      \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
    HEREDOC
  end

  def print_board
    puts "\033[17A#{board.current_board}"
  end

  def switch_player!
    @current_player, @next_player = @next_player, @current_player
  end

  def choose_slot!
    puts "\033[1A#{current_player}, choose a column to place your marker.#{" "*55}\n#{" "*35}\n\033[2A"
    loop do
      column = gets.to_i
      if (1..7).include?(column)
        return current_player.choose_column!(column)
      else
        puts "\033[3APlease give a value between 1 and 7.#{" "*55}\n#{" "*35}\n#{" "*35}\033[1A"
      end
    end
  end

  def game_over?
    current_player.player_win? || board.full?
  end

  def game_over_message
    if current_player.player_win?
      puts "\033[1A#{current_player} won the game!#{" "*35}\n#{" "*75}\n"
    else
      puts "\033[1AIt's a draw.#{" "*42}\n#{" "*85}\n"
    end
  end
end