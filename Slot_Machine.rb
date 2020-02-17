require_relative 'wallet'
require_relative 'player'
 

class Slots
  attr_accessor = :player
  attr_accessor = :wallet

  def initialize(player)
    @player = player
    @wheel_spin = [@row1, @row2, @row3, @row4]
    @wallet = @player.wallet
    slots_inputs
  end
  

# need to figure out how to get the win statements to run
# currently only displays the else statment "Sorry, Try again", even if you get a winning 4 row of numbers
# it does track the wallet -$1 every time you play
# the check wallet function works here as well
# the wallet does not update to the casino menu when you select check wallet in that menu
# but if you come back into slots then check wallet it has the correct amount


  def slot_outcomes
    ones = [1, 1, 1, 1]
    twos = [2, 2, 2, 2]
    threes = [3, 3, 3, 3]
    fours = [4, 4, 4, 4]
    if @wheel_spin == ones
      puts "Congratulations! You won!"
      @wallet = @wallet * 3
    elsif @wheel_spin == twos
      puts "Congratulations! You won!"
      @wallet = @wallet * 3
    elsif @wheel_spin == threes
      puts "Congratulations! You won!"
      @wallet = @wallet * 3
    elsif @wheel_spin == fours
      puts "Congratulations! You won!"
      @wallet = @wallet * 3
    else
      puts "Sorry, try again!"
      @wallet = @wallet - 1
    end
  end
  
  def slots_instructions
      puts "Welcome to the Slot Machine!"
      puts "This machine costs $1 for each pull of the lever."
      puts "Get all 4 numbers aligned and you triple your current wallet!"
      # get all 6's and you lose everything!
    end

  def slots_menu
    puts "Press 1 to start the slot machine!"
    puts "Press 2 to check your wallet."
    puts "press 3 to return to the Casino Menu."
  end

  def slots_game
    run_slots
    slot_outcomes
  end

  def slots_inputs
    slots_instructions
    slots_break = false
    until slots_break == true
      slots_menu
      @inputs = gets.chomp.to_i
      case @inputs
        when 1
          slots_game
        when 2
          puts "Your wallet has $#{@wallet}.00"
        when 3
          slots_break = true
        else
          puts "Invalid Choice. Try again!" 
      end
    end
    update_wallet
  end

  def run_slots
      @row1 = ['1', '2', '3', '4'
      ].sample

      @row2 = ['1', '2', '3', '4'
      ].sample

      @row3 = ['1', '2', '3', '4' 
      ].sample

      @row4 = ['1', '2', '3', '4'
      ].sample
      
      puts "#{@wallet - 1}"
      puts "#{@row1} #{@row2} #{@row3} #{@row4}"
  end


  def update_wallet
    @player.wallet = @wallet
  end

end