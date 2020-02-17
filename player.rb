require_relative 'wallet'

class Player
  attr_accessor :wallet, :player_name, :player_age

  def initialize
    start
  end

  def start
    puts 'Welcome to the Ruby Casino!'
    player_name_start
    player_age_start
    player_wallet_start
  end

  def player_name_start
    puts
    puts "Hello, Let's get your information set up."
    puts
    puts 'Create your own username to play:'
    @player_name = gets.strip
  end

  def player_age_start
    puts
    puts 'What is your age?'
    @player_age = gets.chomp.to_i
    if @player_age >= 21

    elsif @player_age <= 20
      puts "I think you're too young to play"
      exit
    else
      puts 'Error: Age error'
    end
    # @ << {username: new_player_name, age: new_player_age}
  end

  def player_wallet_start
    @wallet_class = Wallet.new
    # puts 'How much money are you starting with to play today?'
    # user_wallet = gets.chomp.to_i
    @wallet = @wallet_class.starting_wallet(1000)
    new_wallet
    puts "Awesome #{@player_name}! You now have $#{@wallet} in your wallet."
  end

  def new_wallet
    @wallet = 1000
  end

  def check_wallet
  Wallet.check_wallet
  end

  def back_to_wallet(ammount)
  Wallet.back_to_wallet(ammount)
  end



end
# player = Player.new
