class Player
  attr_reader :coin, :name
  def initialize (coin)
    @coin = coin
    @name = ""
  end

  def player_name
    puts "What is the player's name?"
    @name = gets.chomp
  end
end
