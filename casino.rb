require_relative 'wallet'
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
    is_running = true
    while is_running == true
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
            is_running = false
          else
            puts "Invalid choice. Please try again"
        end
      end
    end
end

app = CasinoMenus.new

app.app_intro_menu
app.app_menu