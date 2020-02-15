require_relative 'deck_of_cards'
require_relative 'wallet'
# @wallet = Wallet.new

class HighLow
  attr_accessor :wallet, :wins, :losses
  def initialize(wallet_value)
    @wallet = wallet_value
    @deck = Deck.new
    @total_bet = 0
    @house_bet = 0
    @user_bet = 0
    game_main
  end
  def game_main
    loop do
      game_menu
      game_choice = gets.chomp.to_i
      case game_choice
      when 1
        game_start
        player_bet
        house_match_bet
        player_guess
      when 2
        @wallet.check_wallet
      when 3
        break
      else
        puts "That wasn't one of the options"
      end
    end
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
    @cards = "The face down card was:#{@up_card}, the face up card was:#{@down_card}."
  end
  def game_start
    card_setup
    # puts "down is #{down.rank}#{down.suit}" -- this is here for test purposes to make sure the cards are different
    puts "Two cards are on the table."
    puts "One card face-down,"
    puts "and one face-up is the #{@up_card}"
  end
  private
  def house_match_bet
    @house_bet = @user_bet
    @total_bet = @house_bet + @user_bet
    puts "The house has matched your bet of $#{@user_bet}. As is customary."
    puts "There is $#{@total_bet} on the table."
    puts "ALL BETS ARE CLOSED"
  end
  def double_or_nothing
  end
  def player_bet
    wallet = @wallet
    bet_break = false
    until bet_break == true
      puts "Your wallet currently has $#{wallet}"
      puts "How much would you like to bet?"
      @user_bet = gets.chomp.to_i
      if @user_bet > wallet
        puts "You don't have that much to bet."
      else
        @wallet = wallet -= @user_bet
        puts "You have $#{@user_bet} on the table."
        bet_break = true
      end
    end
  end

  def player_menu
    puts "Moment of truth -- "
    puts "Remember your card is the #{@up_card}"
    puts "Is your card higher or lower than the face down card?"
    puts "1) Higher"
    puts "2) Lower"
  end

  def higher_win_conditions
    if @down_value == @up_value
      puts "#{@cards} They were equal, you win!"
      double_or_nothing
      @wallet = @total_bet + @wallet
    elsif @down_value < @up_value
      puts "#{@cards} You lose!"
    elsif @down_value > @up_value
      puts "#{@cards} You win!"
      double_or_nothing
      @wallet = @total_bet + @wallet
    end
  end

  def lower_win_conditions
    if @down_value == @up_value
      puts "#{@cards} They were equal, you win!"
      double_or_nothing
      @wallet = @total_bet + @wallet
    elsif @down_value > @up_value
      puts "#{@cards} You lose!"
      @wallet = @wallet - @total_bet
    elsif @down_value < @up_value 
      puts "#{@cards} You win!"
      double_or_nothing
      @wallet = @total_bet + @wallet
    end
  end

  def player_guess
    break_condition = false
    until break_condition == true
    player_menu
    guess = gets.chomp.to_i
    if guess == 1
      @user_guess = true
      higher_win_conditions
      break_condition = true
      puts @wallet
    elsif guess == 2
      @user_guess = false
      lower_win_conditions
      break_condition = true
      puts @wallet
    else
      puts "That wasn't a choice, lets try that again."
    end
  end
end
def user_win
end
def user_lose
end
def play_again?
end

end

test = HighLow.new(500)

# test.game

# Hi-Lo, or High-Low, is a fairly simple card game. 
# It uses a standard deck of 52 cards, and it has 
# players guess whether a certain card is higher or 
# lower than one showing on the table. There are variations
# for drinking and gambling, but it's a pretty standard and simple game.

# Number of Players
# Technically, the game can have any number of players, but at any given
# time, there are only two players actually playing. The dealer, who is
# in control of the deck, and the player, who is responsible for guessing
# the values of cards, are the only participants.

# Dealing and Play
# After shuffling and cutting the deck, the dealer places one card face-down
# in front of the player, then another card face-up. The rest of the deck,
# he sets aside while the player guesses the value.

# Betting
# After the cards are down, the player places his initial bet. The house
# matches that bet into the pot. When the player guesses, he wins or
# loses the pot depending on the outcome of his guess. After that round,
# the player can pass the bet to another player, or go double or nothing on the next bet.

# Drinking
# The drinking version of the game has players stacking up drinks in order to pass them
# to opponents. Each time the player guesses correctly, she takes the card, and a new card
# is dealt. She can then choose to guess again and get another card, or pass to the next
# player. If she passes, the next player has to take a drink for each card the first player
# won. If the original player guesses incorrectly, however, she has to take a drink, plus
# one for each card she has collected.

# Guessing
# Based on the card that's currently showing, the player has to guess whether the face-down
# card is higher or lower than the face-up card. After the guess, the dealer flips the hidden
# card, and the answer is revealed. If the guess was correct, the player wins and can choose
# to double or pass; if not, the player loses and the dealer moves on.