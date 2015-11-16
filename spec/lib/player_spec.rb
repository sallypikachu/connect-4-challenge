require 'spec_helper'

RSpec.describe Player do
  let(:player) {Player.new("X")}

  describe ".new" do
    it "should initialize Player" do
      expect(player).to be_a(Player)
    end
  end

  describe "#coin" do
    it "should have a reader for coin" do
      expect(player.coin).to eq("X")
    end
  end

  describe "#name" do
    it "should have a reader for name" do
      expect(player.name).to eq("")
    end
    it "should have a writer for name" do
      player.name = "Pikachu"
      expect(player.name).to eq("Pikachu")
    end
  end
end
