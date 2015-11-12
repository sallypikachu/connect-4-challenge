require 'pry'

class Board
  attr_accessor :board
  def initialize
    @board = build_board
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

  def add_coin()

  end
end

board = Board.new
board.display_board
