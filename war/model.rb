class Deck
  attr_reader :deck

  def initialize(decks: 1, board: nil)
    @cards = cards
    @players = players
    @board = board || Array.new(cards)
