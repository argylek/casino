require_relative 'wallet'
require_relative 'slot_machine'
require_relative 'high_or_low'
require_relative 'player'



class CasinoMenus
  

  def initialize 
    app_intro_menu
    
  end
  
  @player = Player.new
  
  
  def app_intro_menu
    @player.start
  end
  def app_menu
    puts "#{@player.player_name} #{Wallet.check_wallet}"
    puts "Which game would you like to play?"
    puts "1) Slots!"
    puts "2) High or Low"
    puts "3) Exit the Casino"
  end
    
  def app
    is_running = true
    while is_running == true
      app_menu
      @game_choice = gets.to_i
        case @game_choice 
          when 1
            @slots = Slots.new
            @slots.run_slots
          when 2
            highlow = HighLow.new(@player)
            highlow.main_menu
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
app.app