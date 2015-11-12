require 'spec_helper'

describe Board do
  let(:board) {Board.new}
  describe ".new" do
    it "should Board class" do
      expect(board).to be_a(Board)
    end
    it "should contain a board which is an Array" do
      expect(board.board).to be_a(Array)
    end
  end

end
