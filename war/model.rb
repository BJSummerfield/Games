
require_relative "views.rb"
def deck(value: (1..13).to_a, suits:%w(Hearts Spades Dimonds Clubs), deck: nil)
  @deck = Array.new(suits.count,(1..13).to_a).flatten
end

def shuffle(deck)
  @deck = deck.shuffle
end

def deal(deck)
  @deck = deck.each_slice(26).to_a
  @p1 = @deck[0]
  @p2 = @deck[1]
end

def play
  if @p1[0]>@p2[0]
    @p1<<@p1.shift
    @p1<<@p2.shift
  elsif @p1[0]<@p2[0]
    @p2<<@p2.shift
    @p2<<@p1.shift
  elsif @p1[0]==@p2[0]
   war
  end
end

  def war
    @war1 = []
    @war2 = []
      @war1<<@p1.shift
      @war2<<@p2.shift
    complete = true
    while complete == true
      2.times do
        @war1<<@p1.shift
        @war2<<@p2.shift
      end
      war?
      checkwin
      if @war1.last > @war2.last
        @p1<<@war1
        @p1<<@war2
        @p1 = @p1.flatten
        complete = false
      elsif @war1.last < @war2.last
        @p2<<@war2
        @p2<<@war1
        @p2 = @p2.flatten
        complete = false
      else
      end
    end
  end

def checkwin
  if @p1.empty?
    puts "Player 2 Wins"
    exit
  elsif @p2.empty?
    puts "Player 1 Wins"
    exit
  end
end

deck
shuffle(@deck)
deal(@deck)
