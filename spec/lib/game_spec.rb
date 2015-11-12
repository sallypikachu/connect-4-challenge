require 'spec_helper'

describe Game do
  let(:game) {Game.new}
  describe ".new" do
    it "should Game class" do
      expect(game).to be_a(Game)
    end
  end
end
