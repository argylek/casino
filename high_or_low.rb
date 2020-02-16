require_relative 'deck_of_cards'
require_relative 'wallet'
class HighLow
  attr_accessor :wallet
  def initialize
    @wallet = Wallet.new
    @wallet = @wallet.wallet
    @deck = Deck.new
    @total_bet = 0
    @house_bet = 0
    @user_bet = 0
    @double_or_nothing = false
    @play_again = true
    main_menu
  end

  def main_menu
    loop do
      game_menu
      game_menu_choice = gets.chomp.to_i
      case game_menu_choice
        when 1
          @play_again = true
          until @play_again == false
          high_low_game
          end
          @double_or_nothing = false
          back_to_wallet
        when 2
          puts @wallet.check_wallet
        when 3
          exit
        else
          puts "That wasn't one of the options"
      end
    end
  end

  private

  def high_low_game
      game_start
      if @double_or_nothing == false
        player_bet
        house_match_bet
      elsif @double_or_nothing == true
        puts "double or nothing flag is working"
      else
        puts "Error - double_or_nothing flag is messed up"
      end
      player_guess
  end

  def game_menu
    # puts "Welcome #{player_name} to the High or Low game!"
    puts "1) Play High or Low"
    puts "2) Check my Current Balance"
    puts "3) Go back to the Casino Floor"
  end
  def card_setup
    @deck.shuffle
    down = @deck.draw_card
    up = @deck.draw_card
    @up_card = "#{up.rank}#{up.suit}"
    @down_card = "#{down.rank}#{down.suit}"
    @up_value = up.value
    @down_value = down.value
    @cards = "The face down card was:#{@down_card}, the face up card was:#{@up_card}."
  end

  def game_start
    card_setup
    # puts "down is #{down.rank}#{down.suit}" -- this is here for test purposes to make sure the cards are different
    puts "Two cards are on the table."
    puts "One face-up and one face-down"
    puts "and one face-up is the #{@up_card}"
  end

  def house_match_bet
    @house_bet = @user_bet
    @total_bet = @house_bet + @user_bet
    puts "The house has matched your bet of $#{@user_bet}. As is customary."
  end

  def player_bet
    wallet = @wallet.wallet
    bet_break = false
    until bet_break == true
      puts "Your wallet currently has $#{wallet}"
      puts "How much would you like to bet?"
      @user_bet = gets.chomp.to_i
      if @user_bet > wallet
        puts "You don't have that much to bet."
      else
        @wallet.wallet = wallet -= @user_bet
        puts "You have $#{@user_bet} on the table."
        bet_break = true
      end
    end
  end

  def player_guess_menu
    puts "Moment of truth -- "
    puts "Remember the face up card is the #{@up_card}"
    puts "Is the face-down card higher or lower than the face-up card"
    puts "1) Higher"
    puts "2) Lower"
  end

  def higher_win_conditions
    if @down_value == @up_value
      puts "#{@cards} They were equal, you win!"
      user_win
    elsif @down_value < @up_value
      puts "#{@cards} You lose!"
      user_lose
    elsif @down_value > @up_value
      puts "#{@cards} You win!"
      user_win
    else 
      puts "higher_win_condidtions error"
    end
  end

  def lower_win_conditions
    if @down_value == @up_value
      puts "#{@cards} They were equal, you win!"
      user_win
    elsif @down_value > @up_value
      puts "#{@cards} You lose!"
      user_lose
    elsif @down_value < @up_value 
      puts "#{@cards} You win!"
      user_win
    else 
      puts "lower_win_condidtions error"
    end
  end

  def player_guess
    puts "There is $#{@total_bet} on the table."
    puts "ALL BETS ARE CLOSED"
    break_condition = false
    until break_condition == true
      player_guess_menu
      guess = gets.chomp.to_i
      if guess == 1
        @user_guess = true
        higher_win_conditions
        break_condition = true
      elsif guess == 2
        @user_guess = false
        lower_win_conditions
        break_condition = true
      else
        puts "That wasn't a choice, lets try that again."
      end
    end
  end

  def back_to_wallet
    wallet = @wallet.wallet
    @wallet.wallet = wallet + @total_bet
    if @total_bet >= 1
      puts "You've added #{@total_bet} to your wallet!"
      @wallet.check_wallet
    elsif @total_bet == 0
      @wallet.check_wallet
    else
      puts "wallet error"
    end
  end

  def user_win
    puts "You currently have won $#{@total_bet}."
    double_or_nothing
  end

  def user_lose
    puts "Oh no! You just lost the pot of! $#{@total_bet}"
    @total_bet = 0
    @play_again = false
  end

  def double_the_bet
    current_bet = @total_bet
    @total_bet = current_bet + current_bet
    puts "The bet has been doubled"
  end

  def double_or_nothing
    break_condition = false
    while break_condition == false
      puts "Would you like to go double or nothing? Y/N"
      user_input = gets.chomp.to_s
      user_conformed_input = user_input.upcase!
    case user_conformed_input
      when "Y"
        double_the_bet
        @double_or_nothing = true
        @play_again = true
        break_condition = true
      when "N"
        @play_again = false
        break_condition = true
      else
        puts "that wasn't an option"
      end
    end
  end

end


# @wallet = 0
# puts @wallet
test = HighLow.new