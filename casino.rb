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

end

CasinoMenus.new