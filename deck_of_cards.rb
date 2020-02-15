  require_relative 'card'
  class Deck
  # Getter and Setter methods for rank, suit and color
  attr_accessor :cards
 
  # Gets called when you call the new method to create an instance
  # deck = Deck.new
  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @suits = %w(♠ ♦ ♣ ♥)
    @cards = []
    generate_deck
  end
 
  def shuffle
   @cards.shuffle
  end

  def cut
    @cards.rotate! @cards.count / 2
  end
  
  def generate_deck
    @ranks.each_with_index do |rank, index|
      @suits.each do |suit|
          # Ternary Operator
          color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
          @cards << Card.new(index + 1, rank, suit, color)
      end
    end
  end
 
   def display_cards
     @cards.shuffle.each do |card|
       puts " #{card.value} #{card.rank} #{card.suit} (#{card.color})"
     end
   end

   def draw_card
    your_card = @cards.sample
    @cards.delete(your_card)
    return your_card
   end
 end

#  deck = Deck.new
#  deck.display_cards
#  deck.cut