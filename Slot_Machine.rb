class Slots

  def initialize
  end
  
  def slot_outcomes(row1, row2, row3)
    if row1 == row2 && row2 == row3
      3
    elsif row1 == row2 || row2 == row3 || row1 == row3
      2
    else
      0 
    end
  end

  def run_slots
    cash = 500
    puts "Welcome to the Slot Machine!"
    puts "Cash total is #{cash}"
    puts "How much would you like to bet?"
      @bet = gets.to_i

      cash -= @bet

      row1 = ['1', '2', '3', '4'
      ].sample

      row2 = ['1', '2', '3', '4'
      ].sample

      row3 = ['1', '2', '3', '4'    
      ].sample

      puts "#{row1} #{row2} #{row3}"

      winnings = @bet * slot_outcomes(row1, row2, row3)
      
      puts "You have won #{winnings}"
      cash += winnings
      puts "Your cash total is now #{cash}"

      puts "Would you like to play again? Y/N"
      if gets.strip.upcase == "N"
        puts "You have ended with #{cash}"
        exit
      else
        run_slots
      end
  end
end