require_relative 'wallet'

class Player
  attr_accessor :wallet, :player_name, :player_age

  def initialize

  end


  def start
    puts "Welcome to the Ruby Casino!"
    player_name
    player_age
    player_wallet
    @wallet = Wallet.new
    
  end

  def player_name
    puts
    puts "Hello, Let's get your information set up."
    puts
    puts "Create your own username to play:"
    @player_name = gets.strip
  end

  def player_age
    puts
    puts "What is your age?"
    @player_age = gets.strip
    puts
  # @ << {username: new_player_name, age: new_player_age}
  end

  def player_wallet
    # puts "How much money are you starting with to play today?"
    # @user_wallet = gets.chomp.to_i
    @wallet.starting_wallet(user_wallet)
    puts "Awesome! You now have $#{@wallet.wallet}.00 in your wallet."
  end

  


end