require_relative 'wallet'

class Player
  attr_accessor :wallet, :player_name, :player_age

  def initialize
    start
  end


  def start
    puts "Welcome to the Ruby Casino!"
    player_name_start
    player_age_start
    player_wallet_start
  end

  def player_name_start
    puts
    puts "Hello, Let's get your information set up."
    puts
    puts "Create your own username to play:"
    @player_name = gets.strip
  end

  def player_age_start
    puts
    puts "What is your age?"
    @player_age = gets.strip
    puts
  # @ << {username: new_player_name, age: new_player_age}
  end

  def player_wallet_start
    test = Wallet.new
    # puts "How much money are you starting with to play today?"
    # user_wallet = gets.chomp.to_i
    @wallet = test.starting_wallet(1000)
    puts "Awesome! You now have $#{@wallet} in your wallet."
  end
end
# player = Player.new
