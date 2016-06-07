require 'pry'

SUITS = {
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
SUITS_DECK = ['H', 'D', 'S', 'C'].freeze
VALUES_DECK = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze
DEALER_LIMIT = 17.freeze
GAME_LIMIT = 21.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def clear
  system "cls"
end

def spell_cards(card)
  if CARDWORDS.include?(card)
    CARDWORDS[card].to_s
  elsif SUITS.include?(card)
    SUITS[card].to_s
  end
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > GAME_LIMIT
  end
  sum
end

def busted?(hand_total)
  if hand_total > GAME_LIMIT
    true
  else
    false
  end
end

def winner?(p_total, d_total)
  result = calc_win(p_total, d_total)

  case result
  when 'Player'
    prompt "You won! Dealer Loses!"
  when 'Dealer'
    prompt "Dealer won! You lose!"
  else
    prompt "Tie!"
  end
end

def calc_win(player, dealer)
  if player.to_i > dealer.to_i
    'Player'
  elsif dealer.to_i > player.to_i
    'Dealer'
  else
    'Tie'
  end
end

def display_totals(p_total, d_total)
  prompt "Your current total: #{p_total}"
  prompt "Dealer current total: #{d_total}"
end
loop do
  scores = {"Player" => 0, "Dealer" => 0, "Tie" => 0}
  loop do
    deck = SUITS_DECK.product(VALUES_DECK).shuffle
    player_hand = []
    dealer_hand = []
    player_total = 0
    dealer_total = 0
    answer = nil

    2.times do
      player_hand << deck.pop
      dealer_hand << deck.pop
    end

    player_total = total(player_hand)
    dealer_total = total(dealer_hand)
    loop do
      prompt "Welcome to Twenty One"
      prompt "The object of the game is to get as close to 21"
      prompt "while not trying to bust or be outplayed by the dealer."
      prompt "Dealer must hit till at least 17 is reached."
      prompt ""
      prompt "Shuffling..."
      prompt ""
      prompt "You: #{spell_cards(player_hand[0][1])} of #{spell_cards(player_hand[0][0])} & #{spell_cards(player_hand[1][1])} of #{spell_cards(player_hand[1][0])}"
      prompt "Dealer: #{spell_cards(dealer_hand[1][1])} of #{spell_cards(dealer_hand[1][0])} and one face down card..."
      prompt ""

      loop do
        prompt "Your current total: #{player_total}"
        prompt ""

        loop do
          prompt "Would you like to (h)it or (s)tay?"
          answer = gets.chomp

          if answer.downcase.start_with?('h')
            player_hand << deck.pop
            player_total = total(player_hand)

            prompt "You drew a #{spell_cards(player_hand.last.last)} of #{spell_cards(player_hand.last.first)}"
            prompt ""
            prompt "Your current total: #{player_total}"
          end
          break if answer.downcase.start_with?('s') || busted?(player_total)
        end

        if busted?(player_total)
          prompt "Player hand over 21, you have busted."
          player_total = 'Busted'
          prompt ""
          display_totals(player_total, dealer_total)
          break
        else
          prompt "You have chosen to stay."
        end
        prompt ""
        prompt "Dealer flips over face down card...#{spell_cards(dealer_hand[0][1])} of #{spell_cards(dealer_hand[0][0])}"
        prompt "Dealer current total: #{dealer_total}"
        prompt ""
        while total(dealer_hand) < DEALER_LIMIT
          prompt "Dealer Hits!"
          prompt ""
          dealer_hand << deck.pop
          dealer_total = total(dealer_hand)
          prompt "Dealer drew a #{spell_cards(dealer_hand.last.last)} of #{spell_cards(dealer_hand.last.first)}"
          prompt "Dealer current total: #{dealer_total}"
          prompt ""
        end
        dealer_total = total(dealer_hand)

        prompt ""
        if busted?(dealer_total)
          prompt "Dealer busted, you win!"
          prompt ""
          dealer_total = "Busted"
          display_totals(player_total, dealer_total)
        else
          display_totals(player_total, dealer_total)
          prompt ""
          winner?(player_total, dealer_total)
        end
        break
      end
      break
    end
    scores[calc_win(player_total, dealer_total)] += 1
    prompt "Your Score: #{scores['Player']}   Dealer Score: #{scores['Dealer']}"
    prompt ""
    break if scores['Player'] == 5 || scores['Dealer'] == 5
    prompt "Would you like to play another round?"
    again = gets.chomp
    break unless again.downcase.start_with?('y')
    clear
  end

  prompt "Thank you for playing Twenty-One!"
  break
end
