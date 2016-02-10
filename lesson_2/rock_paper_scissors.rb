VALID_CHOICES = %w(rock paper scissors spock lizard)
VALID_SHORT = %w(r p s sp l)
player_score = 0
computer_score = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def which?(answer)
  case answer
  when 'r'
    "rock"
  when 'p'
    "paper"
  when 's'
    "scissors"
  when 'sp'
    "spock"
  when 'l'
    "lizard"
  else
    "Incorrect shortcut"
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
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

def player_win(player, computer)
  if win?(player, computer)
    1
  else
    0
  end
end

def computer_win(player, computer)
  if win?(computer, player)
    1
  else
    0
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("For shortcuts (look below)")
    prompt("'r' for rock, 'p' for paper, 's' for scissors, 'sp' for spock, and 'l' for lizard")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice) || VALID_SHORT.include?(choice)
      if VALID_SHORT.include?(choice)
        choice = which?(choice)
      end
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)
  player_score += player_win(choice, computer_choice)
  computer_score += computer_win(choice, computer_choice)

  if player_score >= 5 || computer_score >= 5
    prompt("A winner has been declared!")
    prompt("Player Wins: #{player_score}")
    prompt("Computer Wins: #{computer_score}")
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for playing!")
