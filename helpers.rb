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
      true
    end
  end

  def initialize_deck
    suits=['hearts','diamonds','clubs', 'spades']
      cards=[['ace',11],['king', 10], ['queen',10], ['jack', 10],
      10,9,8,7,6,5,4,3,2]
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

  def dealer_gameplay
    while calculate_total(session[:dealer_cards])<17
      hit(session[:dealer_cards])
      if has_ace(session[:dealer_cards]) && calculate_total(session[:dealer_cards])>21
        session[:dealer_cards].each do |card|
          if card[1]=="Ace"
            card[2]=1
          end
        end
      end
    end
    redirect 'game_over'
  end

  def player_gameplay
    if session[:ace]=="Yes"
      session[:player_cards].each do |card|
        if card[1]=="Ace"
          card[2]=1
        end
      end
      session[:ace]=nil
    elsif session[:hit]=='Yes'
      hit(session[:player_cards])
      if bust(session[:player_cards])
        redirect '/game_over'
      end
    else
    dealer_gameplay
    end
  end

  def reset
    session[:player_cards] = nil
    session[:dealer_cards] = nil
    session[:hit] = nil
    session[:bet] = nil
    session[:deck] = nil
  end

  def okay_bet(bet)
    if session[:player_wallet]>=bet
      true
    end
  end

  def has_ace(hand)
    hand.each do |card|
      if card[1]=="Ace" && card[2]==11
        return true
      end
    end
    return false
  end

  def image(card)
    "<img src='/images/cards/#{card[0]}_#{card[1]}.jpg'>"
  end
end
