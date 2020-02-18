class Card
  # Getter and Setter methods for rank, suit and color

  #added card value and separate blackjack value to play various games with
  attr_accessor :rank, :suit, :color, :value, :blackjack
  # Gets called when you call the new method to create an instance
  # card = Card.new('10', 'K', 'Black')
  def initialize(value, rank, suit, color, blackjack)
    @rank = rank
    @suit = suit
    @color = color
    @value = value
    @blackjack = blackjack
  end
 end
