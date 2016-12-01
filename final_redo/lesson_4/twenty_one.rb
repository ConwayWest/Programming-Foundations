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

def hit(deck, hand)
  hand << deck.delete(deck.sample)
end

def busted?(hand)
  return true if hand > 21
end

2.times { deal_cards(deck, player_hand, dealer_hand) }

loop do
  prompt "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?(player_hand)
  hit(deck, player_hand)
end

if busted?

else

end