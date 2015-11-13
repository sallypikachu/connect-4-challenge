require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player_1, :player_2
  attr_accessor :winner
 def initialize
   @board = Board.new
   @player_1 = Player.new("X")
   @player_2 = Player.new("O")
   @winner = "No One!"
 end

 def play
   puts "Welcome to Connect Four! Let's Play!"
   unique_player_names
   board.display_board
   take_turn
   puts "Winner is #{winner}!"
   play_again unless board.full_board?
 end

 def take_turn
   until a_player_wins(player_1) || a_player_wins(player_2) || !board.full_board?
     board.add_coin(player_1)
     board.display_board
     break if a_player_wins(player_1)
     board.add_coin(player_2)
     board.display_board
   end
 end

def unique_player_names
  puts "Player One:"
  player_1.name = gets.chomp
  puts "Player Two:"
  player_2.name = gets.chomp
  puts "Those names are not unique!!" if player_1.name == player_2.name
  unique_player_names if player_1.name == player_2.name
end

 def a_player_wins(player)
   if board.four_horizontal(player) || board.four_vertical(player)
     @winner = player.name
     true
   else
     false
   end
 end

 def play_again
   puts "Do you want to play again?"
   answer = gets.chomp.downcase
   answer.downcase!
   if answer == "yes" || answer == "y"
     play
   else
     puts "You are both winners in book!"
   end
 end
end

game = Game.new
game.play
