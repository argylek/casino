class Wallet
  attr_accessor :wallet

  def initialize
  end

  def self.add(ammount)
    current_wallet = @wallet.to_i
    @wallet =  current_wallet + ammount.to_i
  end

  def self.subtract(ammount)
    wallet = @wallet.to_i
    @wallet = wallet - ammount.to_i
  end

  def self.check_wallet
    puts "You have $#{@wallet.to_i} in your wallet."
  end

  def starting_wallet(money_to_add)
    @wallet = Wallet.add(money_to_add)
  end

  def self.back_to_wallet(ammount_to_add)
    @wallet = Wallet.add(ammount_to_add)
    if ammount_to_add >= 1
      puts "You've added #{ammount_to_add} to your wallet!"
      Wallet.check_wallet
    elsif ammount_to_add == 0
      Wallet.check_wallet
    else
      puts "wallet error"
    end
  end
  

end

# wallet = Wallet.new
# wallet.starting_wallet(500)
# wallet.check_wallet
# wallet.subtract_money(200)
# wallet.check_wallet
# wallet.back_to_wallet(300)