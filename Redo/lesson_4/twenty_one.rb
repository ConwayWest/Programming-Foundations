SUITES = {
  'S' => 'Spades',
  'D' => 'Diamonds',
  'H' => 'Hearts',
  'C' => 'Clubs'
}.freeze

CARDWORDS = {
  'A' => 'Ace',
  'K' => 'King',
  'Q' => 'Queen',
  'J' => 'Jack',
  '10' => 'Ten',
  '9' => 'Nine',
  '8' => 'Eight',
  '7' => 'Seven',
  '6' => 'Six',
  '5' => 'Five',
  '4' => 'Four',
  '3' => 'Three',
  '2' => 'Two'
}.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def ace_value(hand)
  if hand + 11 > 21
    1
  else
    11
  end
end

def value_cards(card, hand)
  if card == 'A'
    ace_value(hand)
  elsif card == 'J' || card == 'Q' || card == 'K'
    10
  else
    card.to_i
  e
  nd
end

def deal_cards(hand, d)
  hand << d.delete(d.sample)
end

def announce_cards(card)
  if CARDWORDS.include?(card)
    CARDWORDS[card].to_s
  elsif SUITES.include?(card)
    SUITES[card].to_s
  end
end

loop do
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
  player_total = 0
  dealer_total = 0

  deck.shuffle!
  2.times do
    deal_cards(player_hand, deck)
    deal_cards(dealer_hand, deck)
  end

  player_total = value_cards(player_hand[0][1], player_total) + value_cards(player_hand[1][1], player_total)
  dealer_total = value_cards(dealer_hand[1][1], dealer_total)
  loop do
    prompt "Welcome to Twenty One"
    prompt "The object of the game is to get as close to 21"
    prompt "while not trying to bust or be outplayed by the dealer."
    prompt "Dealer must hit till at least 17 is reached."
    prompt ""
    prompt "Shuffling..."
    prompt ""
    prompt "You: #{announce_cards(player_hand[0][1])} of #{announce_cards(player_hand[0][0])} & #{announce_cards(player_hand[1][1])} of #{announce_cards(player_hand[1][0])}"
    prompt "Dealer: #{announce_cards(dealer_hand[1][1])} of #{announce_cards(dealer_hand[1][0])} and one face down card..."
    prompt ""

    loop do
      prompt "Your current total: #{player_total}"
      prompt "Dealer total: #{dealer_total}"
      break
    end
    break
  end
  break
end
