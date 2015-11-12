require_relative 'board'

class Game
 def initialize
 end

 def play
   board = Board.new
   board.display_board
   board.add_coin(board.player_1,'A')
   board.display_board
   board.add_coin(board.player_1)
   board.display_board
 end

 def take_turn
   unless a_player_wins
     board.add_coin(board.player_1)
     board.display_board
     board.add_coin(board.player_1)
     board.display_board
   end
 end

 def a_player_wins
   board.four_horizontal || board.four_vertical || board.four_diagonal
 end
end

# game = Game.new
# game.play
