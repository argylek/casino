class Player
  attr_accessor :name, :wallet

  def initialize
    @wallet = 1000
    puts "******************************************"
    puts "Hello Player1, Let's get your information set up."
    puts "******************************************"
    puts "What is your name?"
    name = gets.chomp
    @name = name
    
    puts "******************************************"
    puts "What is your age?"
    age = gets.strip.to_i
      if age >= 21
        puts "You're good to go!"
      else 
        puts "Come back when you're older, kid!"
      end
    puts "******************************************"
    
  end

  def new_wallet
    @wallet = 1000
  end

end