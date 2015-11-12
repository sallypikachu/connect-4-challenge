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
      expect{board.display_board}.to output("|                  |\n|                  |\n|                  |\n|                  |\n|                  |\n|                  |\n|                  |\n|                  |\n|                  |\n|                  |\nA B C D E F G H I J\n").to_stdout
    end
  end
end
