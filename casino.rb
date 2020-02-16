require_relative 'player'
require_relative 'slot_machine'
require_relative 'high_or_low'
require_relative 'player'


class CasinoMenus
  

  def initialize 
    app_intro_menu
    
  end  

  @slots = Slots.new
  @highlow = HighLow.new
  @player = Player.new
  
  
  def app_intro_menu
    @player.start
  end
    
  def app_menu
    @player = Player.new
    puts "Welcome to the Casino floor #{@player.name}!"
    game_options
  end
    
  def game_options
      @player.wallet
      puts "Which game would you like to play?"
      puts "Slots or High and Low"
      puts "Press 1 for Slots" 
      puts "Press 2 for High and Low"
      puts "Press 3 to reload your wallet"
      puts "Press 4 to view current wallet amount"
      puts "Press 5 to exit the app"
      user_selection
  end
  
  def user_selection
      game_choice = gets.strip.to_i
      case game_choice 
        when 1
          Slots.new(player)
        when 2
          puts "link to High and Low class here"
        when 3
          puts "Here's a fresh wallet!"
          @player.new_wallet
        when 4
          puts "You have $#{@player.wallet}.00 remaining"
        when 5
          puts "Come gamble again soon!"
          exit
        else
          puts "Invalid choice. Please try again"
          app_menu
        end
      game_options
    end
end

CasinoMenus.new