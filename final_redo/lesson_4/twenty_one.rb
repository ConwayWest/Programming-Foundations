require 'pry'

deck = [['D', 'A'], ['D', 2], ['D', 3], ['D', 4], ['D', 5],
        ['D', 6], ['D', 7], ['D', 8], ['D', 9], ['D', 10],
        ['D', 'J'], ['D', 'Q'], ['D', 'K'],
        ['S', 'A'], ['S', 2], ['S', 3], ['S', 4], ['S', 5],
        ['S', 6], ['S', 7], ['S', 8], ['S', 9], ['S', 10],
        ['S', 'J'], ['S', 'Q'], ['S', 'K'],
        ['H', 'A'], ['H', 2], ['H', 3], ['H', 4], ['H', 5],
        ['H', 6], ['H', 7], ['H', 8], ['H', 9], ['H', 10],
        ['H', 'J'], ['H', 'Q'], ['H', 'K'],
        ['C', 'A'], ['C', 2], ['C', 3], ['C', 4], ['C', 5],
        ['C', 6], ['C', 7], ['C', 8], ['C', 9], ['C', 10],
        ['C', 'J'], ['C', 'Q'], ['C', 'K']]
dealer_hand = []
player_hand = []

def prompt(msg)
  puts "=> #{msg}"
end

def deal_cards(deck, player, dealer)
  player << deck.delete(deck.sample)
  dealer << deck.delete(deck.sample)
end

def display_hands(player, dealer, game_phase = 'player')
  system('clear')
  prompt "WELCOME TO TWENTY-ONE!"
  prompt "Player Hand: #{player}"
  prompt "Value: #{hand_value(player)}"
  puts ""
  if game_phase == 'player'
    prompt "Dealer Hand: #{dealer[0]}"
    prompt "Value: #{hand_value(dealer[0])}"
  else
    prompt "Dealer Hand: #{dealer}"
    prompt "Value: #{hand_value(dealer)}"
  end
  puts ""
end

def hit(deck, hand)
  hand << deck.delete(deck.sample)
end

def busted?(hand)
  return true if hand_value(hand) > 21
end

def hand_value(hand)
  values = []

  if hand.flatten.size == 2
    values << hand[1]
  else
    hand.each do |x|
      values << x[1]
    end
  end
  get_face_cards_value(values)
  ace_value(values)
  sum_values(values)
end

def get_face_cards_value(card_values)
  card_values.each do |x|
    if ['J', 'Q', 'K'].include?(x)
      card_values[card_values.index(x)] = 10
    end
  end
end

def ace_value(card_values)
  card_values.each do |x|
    if x == 'A'
      if sum_values(card_values) > 10
        card_values[card_values.index(x)] = 1
      else
        card_values[card_values.index(x)] = 11
      end
    end
  end
end

def sum_values(card_values)
  sum = 0

  card_values.each do |x|
    sum += x if x != 'A'
  end
  sum
end

2.times { deal_cards(deck, player_hand, dealer_hand) }

loop do
  display_hands(player_hand, dealer_hand)
  prompt "hit or stay?"
  answer = gets.chomp

  break if answer == 'stay' || busted?(player_hand)
  hit(deck, player_hand)
  break if busted?(player_hand)
end

if busted?(player_hand)
  display_hands(player_hand, dealer_hand, 'dealer')
  prompt "You busted!!!"
end

loop do
  break if hand_value(dealer_hand) >= 17 || busted?(dealer_hand)
  hit(deck, dealer_hand)
end

if busted?(dealer_hand) && !busted?(player_hand) == true
  display_hands(player_hand, dealer_hand, 'dealer')
  prompt "Dealer busted, you win!!!"
end

if !!busted?(player_hand) == false && !!busted?(dealer_hand) == false
  display_hands(player_hand, dealer_hand, 'dealer')

  if hand_value(player_hand) > hand_value(dealer_hand)
    prompt "You win!"
  elsif hand_value(player_hand) < hand_value(dealer_hand)
    prompt "You lose."
  else
    prompt "It's a tie!"
  end
end

prompt "Thanks for playing!"
