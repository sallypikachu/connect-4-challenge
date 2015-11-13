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
    board = Array.new(11) {Array(12)}
    board.each do |row|
      row[0] = '|'
      row.fill(" ", 1..10)
      row[11] = '|'
    end
    x_coordinate = ('A'..'J').to_a
    x_coordinate.unshift(" ")
    x_coordinate << " "
    board[10] = x_coordinate
    board
  end

  def display_board
    @board.each_with_index do |row|
      puts "#{row.join(" ")}"
    end
  end

  def add_coin(player, position = nil)
    position = ask_for_position if position == nil
    column = COLUMNS[position]
    board[last_row(9,column)][column] = player.coin
  end

  def ask_for_position
    puts "Where would you like to put your coin? (A-J)"
    position = gets.chomp.upcase
  end

  def last_row(row, column)
    if board[row][column] == " "
      row
    else
      if row >= 1
        last_row(row-1, column)
      else
        puts "That column is already filled! Just for that, I'm going to skip your turn >=P"
        0
      end
    end
  end

  def four_horizontal(player)
    four_consecutive = false
    board.each do |row|
      four_consecutive = true if row.join("").include?(player.coin*4)
    end
    four_consecutive
  end

  def four_vertical(player)
    four_consecutive = false
    board.transpose.each do |row|
      four_consecutive = true if row.join("").include?(player.coin*4)
    end
    four_consecutive
  end
end
