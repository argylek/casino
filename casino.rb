require_relative 'player'
require_relative 'slot_machine'
require_relative 'high_or_low'
require_relative 'player'

class CasinoMenus
  def initialize
    @player = Player.new
    app
  end

  def app_menu
    puts "Which game would you like to play?"
    puts "1) Slots!"
    puts "2) High or Low"
    puts "3) Check current wallet amount"
    puts "4) Reset Wallet to $1000"
    puts "5) Exit the Casino"
  end

  def app
    puts "#{@player.player_name} #{Wallet.check_wallet}"
    is_running = true
    while is_running == true
      app_menu
      @game_choice = gets.to_i
        case @game_choice 
          when 1
            @slots = Slots.new(@player)
          when 2
            highlow = HighLow.new(@player)
            highlow.main_menu
          when 3
            Wallet.check_wallet
          when 4
            @player.new_wallet
          when 5
            puts "Come gamble again soon!"
            is_running = false
          else
            puts "Invalid choice. Please try again"
        end
    end
  end
end

app = CasinoMenus.new