deck = [['S', '2'], ['S', '3'], ['S', '4'],
        ['S', '5'], ['S', '6'], ['S', '7'],
        ['S', '8'], ['S', '9'], ['S', '10'],
        ['S', 'J'], ['S', 'Q'], ['S', 'K'],
        ['S', 'A'], ['D', '2'], ['D', '3'],
        ['D', '4'], ['D', '5'], ['D', '6'],
        ['D', '7'], ['D', '8'], ['D', '9'],
        ['D', '10'], ['D', 'J'], ['D', 'Q'],
        ['D', 'K'], ['D', 'A'], ['H', '2'],
        ['H', '3'], ['H', '4'], ['H', '5'],
        ['H', '6'], ['H', '7'], ['H', '8'],
        ['H', '9'], ['H', '10'], ['H', 'J'],
        ['H', 'Q'], ['H', 'K'], ['H', 'A'],
        ['C', '2'], ['C', '3'], ['C', '4'],
        ['C', '5'], ['C', '6'], ['C', '7'],
        ['C', '8'], ['C', '9'], ['C', '10'],
        ['C', 'J'], ['C', 'Q'], ['C', 'K'],
        ['C', 'A']]
player_hand = []
dealer_hand = []

def ace_value(card)
  if card + 11 > 21
    1
  else
    11
  end
end

def face_value(card)
  if card == 'J' || card == 'Q' || card == 'K'
    10
  end
end

def shuffle(d)
  d.shuffle!
end

def deal_cards(player, dealer, d)
  2.times do 
    player << d.sample
    dealer << d.sample
  end
end

loop do
  shuffle(deck)
  deal_cards(player_hand, dealer_hand, deck)
  deck.delete(player_hand)
  deck.delete(dealer_hand)

  p player_hand
  p dealer_hand
  p deck
  break
end
