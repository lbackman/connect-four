require_relative 'game'
require_relative 'board'
require_relative 'player'

board = Board.new
player_1 = Player.new(board, 1)
player_2 = Player.new(board, 2)
game = Game.new(board, player_1, player_2)

game.play