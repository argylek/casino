require_relative 'deck_of_cards'
require_relative 'wallet'
require_relative 'player'
require_relative 'visuals'

class HighLow
  attr_accessor :wallet, :player

  def initialize(main_player)
    @deck = Deck.new
    @total_bet = 0
    @house_bet = 0
    @user_bet = 0
    @double_or_nothing = false
    @play_again = true
    @player = main_player
    @wallet = @player.wallet
    main_menu
  end

  def main_menu
    puts "Welcome #{@player.player_name} to the High or Low game!"
    loop do
      game_menu
      Visuals.fancy_seperator
      game_menu_choice = gets.chomp.to_i
      case game_menu_choice
      when 1
        @play_again = true
        high_low_game until @play_again == false
        @double_or_nothing = false
      when 2
        puts Wallet.check_wallet
      when 3
        break
      else
        Visuals.seperator
        puts "That wasn't one of the options"
        Visuals.seperator
      end
    end
    update_wallet
  end

  private

  def update_wallet
    # puts "Player Wallet #{@player.wallet}, instance wallet #{@wallet}"
    @player.wallet = @wallet
    # puts "The Wallet is now #{@player.wallet}"
  end

  def high_low_game
    game_start
    if @double_or_nothing == false
      player_bet
      house_match_bet
    elsif @double_or_nothing == true
      # puts "double or nothing flag is working"
    else
      puts 'Error - double_or_nothing flag is messed up'
    end
    player_guess
  end

  def game_menu
    Visuals.fancy_seperator
    puts '1) Play High or Low'
    puts '2) Check my Current Balance'
    puts '3) Go back to the Casino Floor'
    Visuals.fancy_seperator
  end

  def card_setup
    @deck.shuffle
    down = @deck.draw_card
    up = @deck.draw_card
    @up_card = "#{up.rank}#{up.suit}"
    @down_card = "#{down.rank}#{down.suit}"
    @up_value = up.value.to_i
    @down_value = down.value.to_i
    Visuals.seperator
    @cards = "The face down card was:#{@down_card}, the face up card was:#{@up_card}."
    Visuals.seperator
  end

  def game_start
    card_setup
    # puts "down is #{down.rank}#{down.suit}" -- this is here for test purposes to make sure the cards are different
    puts 'The Dealer puts two cards on the table.'
    puts 'One face-up and one face-down'
    Visuals.fancy_seperator
    puts "and one face-up is the #{@up_card}"
  end

  def player_bet
    Visuals.seperator
    bet_break = false
    while bet_break == false
      Wallet.check_wallet
      wallet = @wallet
      puts 'How much would you like to bet?'
      Visuals.seperator
      @user_bet = gets.chomp.to_i
      if @user_bet > wallet
        Visuals.fancy_seperator
        puts "You don't have that much to bet."
        Visuals.fancy_seperator
      elsif @user_bet <= wallet
        updated_wallet = Wallet.subtract(@user_bet)
        Visuals.fancy_seperator
        puts "You have bet $#{@user_bet}"
        Visuals.fancy_seperator
        bet_break = true
      else
        puts 'Betting error -- please check code'
      end
      @wallet = updated_wallet
    end
  end

  def house_match_bet
    @total_bet = @user_bet * 2
    Visuals.seperator
    puts "The house has matched your bet of $#{@user_bet}."
    sleep 1
    puts 'As is customary.'
    sleep 2
  end

  def player_guess_menu
    Visuals.fancy_seperator
    puts "Remember the face up card is the #{@up_card}"
    Visuals.seperator
    puts 'Moment of truth -- '
    sleep 1
    puts 'Is the face-down card higher or lower than the face-up card'
    puts '1) Higher'
    puts '2) Lower'
  end

  def higher_win_conditions
    Visuals.seperator
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
      puts 'higher_win_condidtions error'
    end
    Visuals.seperator
  end

  def lower_win_conditions
    Visuals.seperator
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
      puts 'lower_win_condidtions error'
    end
    Visuals.seperator
  end

  def player_guess
    Visuals.fancy_seperator
    puts "There is $#{@total_bet} in the pot."
    puts 'ALL BETS ARE CLOSED'
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

  def user_win
    puts "You currently have won $#{@total_bet}."
    double_or_nothing
  end

  def user_lose
    puts "Oh no! You just lost the pot of! $#{@total_bet}"
    total_bet_zeroed
    @play_again = false
  end

  def double_the_bet
    current_bet = @total_bet
    @total_bet = current_bet * 2
    puts 'The pot has been doubled'
  end

  def total_bet_zeroed
    @total_bet = 0
  end

  def double_or_nothing
    break_condition = false
    until break_condition == true
      puts 'Would you like to go double or nothing? Y/N'
      user_input = gets.chomp.to_s
      user_conformed_input = user_input.upcase!
      case user_conformed_input
      when 'Y'
        double_the_bet
        @double_or_nothing = true
        @play_again = true
        break_condition = true
      when 'N'
        Wallet.back_to_wallet(@total_bet)
        total_bet_zeroed
        @play_again = false
        break_condition = true
      else
        puts "that wasn't an option"
        end
    end
  end
end

# player = Player.new
# test = HighLow.new(player)
#
# puts "We are outside of the game"
# player.check_wallet
