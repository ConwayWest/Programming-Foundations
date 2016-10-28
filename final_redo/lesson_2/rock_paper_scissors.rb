VALID_CHOICES = %w(rock paper scissors lizard spock)
SHORTENED_CHOICES = %(r p s l sp)
CHOOSE_MESSAGE = "R for Rock, P for Paper, S for scissors, L for Lizard, and SP for Spock"

def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def return_full_choice(intitial)
  VALID_CHOICES.each do |x|
    return x if x.start_with?(intitial)
  end
end

def first_to_five(score_hash)
  score_hash.each do |key, value|
    return score_hash[key] if value >= 5
  end
  0
end

scores = {'player' => 0, 'computer' => 0}

loop do
  choice = ''
  loop do
    prompt("Choose one: #{CHOOSE_MESSAGE}")
    choice = Kernel.gets().chomp().downcase()

    break if SHORTENED_CHOICES.include?(choice)
    prompt("INVALID CHOICE! PLEASE TRY AGAIN")
  end

  long_form_choice = return_full_choice(choice)

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose: #{long_form_choice}; Computer chose: #{computer_choice}")

  display_results(long_form_choice, computer_choice)
  scores['player'] += 1 if win?(long_form_choice, computer_choice)
  scores['computer'] += 1 if win?(computer_choice, long_form_choice)

  if (first_to_five(scores) >= 5)
    prompt("Player Score: #{scores['player']}; Computer Score: #{scores['computer']}")
    break
  end

  prompt("Do you want to play again?")
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase().start_with?('y')
end

prompt("Thank you for playing Goodbye!")
