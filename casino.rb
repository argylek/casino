require_relative 'dice'
require_relative 'deck_of_cards'
require_relative 'wallet'
require_relative 'slot_machine'



class CasinoMenus
  def initialize 
    @wallet = Wallet.new
    @slots = Slots.new
    @dice = Dice.new
    @deck = Deck.new
    @slots = Slots.new
    app_menu
  end  
  
  
  def app_intro_menu
    puts "Welcome to the Ruby Casino!"
    puts "What is your name?"
    @gambler_name = gets.strip
    puts "Okay #{@gambler_name}. How much money would you like to gamble with tonight?"
    @wallet.starting_wallet
    puts "Awesome! You now have $#{@wallet.wallet}.00 in your wallet."
  end
    
  def app_menu 
    puts "#{@gambler_name} #{@wallet.check_wallet}"
    puts "Which game would you like to play?"
    puts "Slots or High and Low"
    puts "Press 1 for Slots or Press 2 for High and Low"
    puts "Press 3 to exit the app"
    @game_choice = gets.to_i
      case @game_choice 
        when 1
          @slots.run_slots
        when 2
          # link to High and Low class
        when 3
          puts "Come gamble again soon!"
          exit
        else
          puts "Invalid choice. Please try again"
      end
      app_menu
    end
end