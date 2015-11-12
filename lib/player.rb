class Player
  attr_reader :coin
  attr_accessor :name
  def initialize (coin)
    @coin = coin
    @name = ""
  end


  def player_name
    puts "what player"
  end
end
