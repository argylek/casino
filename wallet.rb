

class Wallet
  attr_accessor :wallet

  def initialize
    @wallet = 0
  end

  def add_money(ammount)
    wallet = @wallet.to_i
    @wallet =  wallet + ammount.to_i
  end

  def subtract_money(ammount)
    wallet = @wallet.to_i
    @wallet = wallet - ammount.to_i
  end

  def check_wallet
    puts @wallet.to_i
  end

end

tester = Wallet.new


# wallet = wallet.tester
tester.add_money(10)
tester.check_wallet
tester.subtract_money(5)
tester.check_wallet