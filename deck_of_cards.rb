require_relative 'card'
class Deck
  # Getter and Setter methods for rank, suit and color
  attr_accessor :cards

  # Gets called when you call the new method to create an instance
  # deck = Deck.new
  def initialize
    @ranks = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    @suits = %w[♠ ♦ ♣ ♥]
    @cards = []
    generate_deck
  end

  def generate_deck
    @ranks.each_with_index do |rank, _index|
      @suits.each do |suit|
        # Ternary Operator
        color = suit == '♠' || suit == '♣' ? 'Black' : 'Red'
        value = value(rank)
        blackjack = blackjack(rank)
        @cards << Card.new(value, rank, suit, color, blackjack)
      end
    end
    shuffle
  end

  def blackjack(rank)
    value = if %w[J Q K].include?(rank)
              10
            elsif rank == 'A'
              11
            else
              rank
            end
    value
  end

  def value(rank)
    value = if rank == 'J'
              11
            elsif rank == 'Q'
              12
            elsif rank == 'K'
              13
            elsif rank == 'A'
              1
            else
              rank
            end
    value
  end

  def display_cards
    @cards.each do |card|
      puts "Value:#{card.value} #{card.rank} #{card.suit} (#{card.color}) BlackJack Value:#{card.blackjack}"
    end
  end

  def draw_card
    @cards.shift
    # puts "Your card is #{card.rank} of #{card.suit}"
  end

  def cards_in_deck
    remaining = @cards.count
    puts "There are #{remaining} cards in the deck"
  end

  def shuffle
    @cards.shuffle!
  end

  def cut
    @cards.rotate! @cards.count / 2
  end
 end

#  deck = Deck.new
#  deck.cards_in_deck
#  deck.draw_card
#  deck.cards_in_deck
