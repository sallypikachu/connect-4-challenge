class Player
  attr_reader :coin
  attr_accessor :name
  def initialize (coin)
    @coin = coin
    @name = ""
  end
end
