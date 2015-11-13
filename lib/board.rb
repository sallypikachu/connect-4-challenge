require 'pry'

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

  attr_accessor :board
  def initialize
    @board = build_board
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
    puts "#{player.name} --- Where would you like to put your coin #{player.coin}? (A-J)"
    position = ask_for_position until COLUMNS.key?(position)
    column = COLUMNS[position]
    board[last_row(9,column)][column] = player.coin if board[0][column] == " "
    puts "That column is already filled!" if board[0][column] != " "
  end

  def ask_for_position
    position = gets.chomp.upcase
    position
  end

  def last_row(row, column)
    if board[row][column] == " "
      row
    else
      last_row(row-1, column) if row >= 1
    end
  end

  def four_horizontal(player)
    four_consecutive = false
    board.each do |row|
      four_consecutive = true if row.join.include?(player.coin*4)
    end
    four_consecutive
  end

  def four_vertical(player)
    four_consecutive = false
    board.transpose.each do |row|
      four_consecutive = true if row.join.include?(player.coin*4)
    end
    four_consecutive
  end

  def full_board?
    board[0].any?{|column| column == " "}
  end
end
