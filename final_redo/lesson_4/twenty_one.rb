require 'pry'

SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
DEALER_LIMIT = 17
GAME_LIMIT = 21

def prompt(msg)
  puts "=> #{msg}"
end

def new_deck
  SUITS.product(VALUES).shuffle
end

def deal_cards(deck, player, dealer)
  player << deck.delete(deck.sample)
  dealer << deck.delete(deck.sample)
end

def display_hands(player, dealer, game_phase, error = 0)
  system('clear')
  prompt "###INVALID INPUT###" if error > 0
  prompt "Welcome to Twenty-One!"
  prompt "Player Hand: #{player}"
  prompt "Value: #{hand_value(player)}"

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
  return true if hand_value(hand) > GAME_LIMIT
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
    if x == 'A' && sum_values(card_values) > 10
      card_values[card_values.index(x)] = 1
    elsif x == 'A'
      card_values[card_values.index(x)] = 11
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

def play_again?(player_hand, dealer_hand)
  puts "------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  display_hands(player_hand, dealer_hand, 'dealer')
  answer.downcase.start_with?('y')
end

score_keeper = { 'player' => 0, 'dealer' => 0 }
loop do
  deck = new_deck
  dealer_hand = []
  player_hand = []
  2.times { deal_cards(deck, player_hand, dealer_hand) }

  loop do
    player_input = nil
    error_counter = 0
    loop do
      display_hands(player_hand, dealer_hand, 'player', error_counter)
      prompt "Please input Hit or Stay (not case sensitive)"
      player_input = gets.chomp.downcase

      break if player_input == 'hit' ||
               player_input == 'stay' ||
               hand_value(player_hand) == GAME_LIMIT
      error_counter += 1
    end

    error_counter = 0
    hit(deck, player_hand) if player_input == 'hit'
    break if player_input == 'stay' ||
             busted?(player_hand) ||
             hand_value(player_hand) == GAME_LIMIT
  end

  player_total = hand_value(player_hand)
  if busted?(player_hand)
    display_hands(player_hand, dealer_hand, 'dealer')
    prompt "You busted!!!"
    play_again?(player_hand, dealer_hand) ? next : break
  end

  loop do
    break if hand_value(dealer_hand) >= DEALER_LIMIT ||
             busted?(dealer_hand) ||
             player_total == GAME_LIMIT
    hit(deck, dealer_hand)
  end

  dealer_total = hand_value(dealer_hand)
  if busted?(dealer_hand) && !busted?(player_hand) == true
    display_hands(player_hand, dealer_hand, 'dealer')
    prompt "Dealer busted, you win!!!"
    play_again?(player_hand, dealer_hand) ? next : break
  end

  if !!busted?(player_hand) == false && !!busted?(dealer_hand) == false
    display_hands(player_hand, dealer_hand, 'dealer')

    if player_total > dealer_total
      score_keeper['player'] += 1
      prompt "You win!"
    elsif player_total < dealer_total
      score_keeper['dealer'] += 1
      prompt "You lose."
    else
      prompt "It's a tie!"
    end
  end
  break unless play_again?(player_hand, dealer_hand) ||
               score_keeper['player'] == 5 ||
               score_keeper['dealer'] == 5
end

prompt "SCORES"
prompt "Player: #{score_keeper['player']}   Dealer: #{score_keeper['dealer']}"
prompt "Thanks for playing!"
