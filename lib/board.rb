require 'pry'
require_relative 'player'

class Board
  COLUMNS = {
    'A' => 1,
    'B' => 2,
    'C' => 3,
    'D' => 4,
    'E' => 5,
    'F' => 6,
    'G' => 7,
    'H' => 8,
    'I' => 9,
    'J' => 10,
  }
  attr_reader :player_1
  attr_accessor :board
  def initialize
    @board = build_board
    @player_1 = Player.new("X")
    @player_2 = Player.new("O")
  end

  def build_board
    board = Array.new(12) {Array(11)}
    board.each do |row|
      row[0] = '|'
      row.fill(" ", 1..10)
      row[11] = '|'
    end
    x_coordinate = ('A'..'J').to_a
    board[10] = x_coordinate
    board
  end

  def display_board
    @board.each_with_index do |row, index|
      puts "#{row.join(" ")}" if index < 10
    end
    puts "  #{@board[10].join(" ")}  "
  end

  def add_coin(player, position = nil)
    position = ask_for_position if position == nil
    #board[9][1] = player.coin
    column = COLUMNS[position]
    board[last_row(9,column)][column] = player.coin
  end

  def ask_for_position
    puts "Where would you like to put your coin? (A-J)"
    position = gets.chomp.upcase
  end

  def last_row(row, column)
    board[row][column] == " " ? row : last_row(row-1, column)
  end
end

# board = Board.new
# board.display_board
# board.add_coin(board.player_1,'A')
# board.display_board
# board.add_coin(board.player_1)
