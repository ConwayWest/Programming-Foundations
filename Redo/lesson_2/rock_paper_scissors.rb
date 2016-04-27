VALID_CHOICES = %w(r p s l sp).freeze
player_score = 0
computer_score = 0

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  puts("=> #{message}")
end

def assign_choice(user_pick)
  case user_pick
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def score_keeper(player, computer, player_point, computer_point)
  if win?(player, computer)
    player_point + 1
  elsif win?(computer, player)
    computer_point + 1
  end
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

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("r = rock, p = paper, s = scissors, l = lizard, sp = spock")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Please enter valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  choice = assign_choice(choice)
  computer_choice = assign_choice(computer_choice)

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)
  score_keeper(choice, computer_choice, player_score, computer_score)

  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  clear_screen
end

prompt("Thank you for playing. Goodbye!")
