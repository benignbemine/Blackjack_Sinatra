helpers do

  def calculate_total(cards)
    sum=0
    cards.each do |card|
      sum+=card.last
    end
    return sum
  end

  def show_card(card)
      "The #{card[1]} of #{card[0]}"
  end

  def hit(hand)
    hand<<session[:deck].pop
  end

  def bust(hand)
    if calculate_total(hand)>21
      "BUST"
    else
      "All Good"
    end
  end

  def initialize_deck
    suits=['Hearts','Diamonds','Clubs', 'Spades']
      cards=[['Ace',11],['King', 10], ['Queen',10], ['Jack', 10], 10,9,8,7,6,5,4,3,2]
      deck = []
      suits.each do |suit|
        cards.each do |card|
          deck<<[suit, card].flatten
        end
      end
    session[:deck] = deck.shuffle!

    #Deal Cards

    session[:player_cards] = []
    session[:dealer_cards] = []
    hit(session[:player_cards])
    hit(session[:dealer_cards])
    hit(session[:player_cards])
    hit(session[:dealer_cards])
  end

end