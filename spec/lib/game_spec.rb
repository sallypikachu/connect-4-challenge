require 'spec_helper'

RSpec.describe Game do
  let(:game) {Game.new}

  describe ".new" do
    it "should Game class" do
      expect(game).to be_a(Game)
    end
  end

  describe "#board" do
    it "should Board class" do
      expect(game.board).to be_a(Board)
    end
  end

  describe "#player_1" do
    it "should Player class" do
      expect(game.player_1).to be_a(Player)
    end
  end
  describe "#player_2" do
    it "should Player class" do
      expect(game.player_2).to be_a(Player)
    end
  end

  describe "#winner" do
    it "should print out the winner" do
      expect(game.winner).to eq("No One!")
    end
  end
end
