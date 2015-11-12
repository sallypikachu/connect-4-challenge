require 'spec_helper'

RSpec.describe Board do
  let(:board) {Board.new}

  describe ".new" do
    it "should Board class" do
      expect(board).to be_a(Board)
    end
    it "should contain a board which is an Array" do
      expect(board.board).to be_a(Array)
    end
  end

  describe "#display_board" do
    it "should display board when board is first initialized" do
      expect{board.display_board}.to output("|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n  A B C D E F G H I J  \n").to_stdout
    end
  end

  describe "#add_coin" do
    it "should add a coin to the specified column and the coin is representative of each of the two players" do
      board.add_coin(board.player_1,'A')
      expect{board.display_board}.to output("|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n|                     |\n| X                   |\n  A B C D E F G H I J  \n").to_stdout
    end
  end
end
