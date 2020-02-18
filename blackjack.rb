require_relative 'player'
require_relative 'card'
require_relative 'deck_of_cards'
require_relative 'visuals'
require_relative 'hand'

class BlackJack
attr_reader :player_hand, :dealer_hand
attr_accessor :player, :wallet
def initialize(player)
		@player = player
		@wallet = @player.wallet
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
		@user_bet = 0
		main_menu
end
def main_menu_text
		puts "Hey #{@player.player_name}, Welcome to the BlackJack Area!"
		Visuals.fancy_separator
		puts "What would you like to do?"
		puts "1) Play BlackJack"
		puts "2) Check Wallet"
		puts "3) Go back to the casino floor"
end
def update_wallet
		puts "The Current wallet is $#{@wallet}"
		puts "The Current player wallet is $ #{@player.wallet}"
		@player.wallet = @wallet
		puts "The new player wallet is $#{player.wallet}"
end
def place_bet
		bet_break = false
		while bet_break == false
			Wallet.check_wallet
			Visuals.separator
			puts "How much do you want to bet?"
			Visuals.separator
			@user_bet = gets.chomp.to_i
			if @user_bet > @wallet
				Visuals.fancy_separator
				puts "You don't have that much to bet."
				Visuals.fancy_separator
			elsif @user_bet <= @wallet
				updated_wallet = Wallet.subtract(@user_bet)
				Visuals.fancy_separator
				puts "You have bet $#{@user_bet}"
				bet_break = true
			else
				puts "Error - betting logic code error"
			end
			@wallet = updated_wallet
		end
end
def game_menu
	leave_game_menu = false
	until leave_game_menu == true
		game_menu_text
		user_input = gets.chomp.to_i
		2.times { @player_hand.hit!(@deck) }
  	2.times { @dealer_hand.hit!(@deck) }
		case user_input
		when 1
			check_cards
		when 2
			check_dealer_cards
		when 3
			place_bet
		when 4
			hit
		when 5
			stand
		when 6
			leave_game_menu = true
		else
			puts "That wasn't an option -- try that again."
		end
	end
end

def game_menu_text
	puts "You've arrived at the BlackJack Table"
	puts "The dealer shuffles the deck"
	puts "The dealer hands you your cards"
	Visuals.separator
	puts "The current bet is $#{@user_bet}"
	Visuals.separator
	puts "What would you like to do?"
	puts "1) Check my cards and their values"
	puts "2) Check the dealers cards and their values"
	puts "3) Bet"
	puts "4) Hit"
	puts "5) Stand"
	puts "6) Leave the table"
end

def main_menu
	main_menu = true
	until main_menu == false
		main_menu_text
		user_choice = gets.chomp.to_i
		case user_choice
			when 1
				game_menu
			when 2
				Wallet.check_wallet
			when 3
				main_menu = false
			else
				puts "That wasn't really an option -- Try again"
		end
	end
	update_wallet
end

def player_cards
	inspect
end

def dealer_cards
	inspect
end

def hit
	@player_hand.hit!(@deck)
	Visuals.fancy_separator
	puts 'The Dealer hands you another card'
end

def stand
  @dealer_hand.play_as_dealer(@deck)
  @winner = determine_winner(@player_hand.value, @dealer_hand.value)
end

def status
	{
	player_cards: @player_hand.cards,
  player_value: @player_hand.blackjackvalue,
  dealer_cards: @dealer_hand.cards,
  dealer_value: @dealer_hand.blackjackvalue,
  winner: @winner
	}
end

def determine_winner(player_value, dealer_value)
  return :dealer if player_value > 21
  return :player if dealer_value > 21
	if player_value == dealer_value
    :push
  elsif player_value > dealer_value
    :player
  else
    :dealer
  end
end

def inspect
  status
end
end

# player = Player.new
# blackjack = BlackJack.new(player)
