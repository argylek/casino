require_relative 'deck_of_cards'

class HighLow
  def initialize(wallet_value)
    @wallet = wallet_value
    @deck = Deck.new
  end

  def shuffle_and_cut
    @deck.shuffle
    @deck.cut
  end

  def game_start
    @card_face_down = @deck.draw_card
    down = @card_face_down
    puts "#{down.value}#{down.suit}#{down.rank}"
    @card_face_up = @deck.draw_card
    up = @card_face_up
    puts "#{up.value}, #{up.suit}, #{up.rank}"
  end

  def player_guess
  end

  def player_bet
  end

  def house_match_bet
  end

  def double_or_nothing
  end



  def game
  end

  def game_menu
  end

end

test = HighLow.new(500)

test.game_start

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