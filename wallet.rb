require_relative 'player'

class Wallet
  attr_accessor :wallet

  def initialize; end

  def self.add(amount)
    current_wallet = @wallet.to_i
    @wallet = current_wallet + amount.to_i
  end

  def self.subtract(amount)
    current_wallet = @wallet.to_i
    @wallet = current_wallet - amount.to_i
  end

  def self.check_wallet
    puts '*************'
    puts "You have $#{@wallet} in your wallet."
  end

  def starting_wallet(money_to_add)
    Wallet.add(money_to_add)
  end

  def self.back_to_wallet(amount_to_add)
    @wallet = Wallet.add(amount_to_add)
    if amount_to_add >= 1
      puts "You've added @#{amount_to_add} to your wallet!"
      Wallet.check_wallet
    elsif amount_to_add == 0
      Wallet.check_wallet
    else
      puts 'wallet error'
    end
  end
end

# player = Player.new

# Wallet.check_wallet
# Wallet.add(10)
# Wallet.check_wallet
# Wallet.subtract(10)
# Wallet.check_wallet
# Wallet.back_to_wallet(2000)
