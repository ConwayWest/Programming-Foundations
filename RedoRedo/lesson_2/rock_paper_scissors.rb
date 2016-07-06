VALID_CHOICES = %w(rock paper scissors spock lizard).freeze
SHORT_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def win?(first, second)
  first == 'rock' && (second == 'scissors' || second == 'lizard') ||
    first == 'scissors' && (second == 'paper' || second == 'lizard') ||
    first == 'paper' && (second == 'rock' || second == 'spock') ||
    first == 'spock' && (second == 'rock' || second == 'scissors') ||
    first == 'lizard' && (second == 'paper' || second == 'spock')
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

def score_keeper(player, computer)
  if win?(player, computer)
    "player"
  elsif win?(computer, player)
    "computer"
  else
    "tie"
  end
end

loop do
  scores = {
    "player" => 0,
    "computer" => 0,
    "tie" => 0
  }
  loop do

    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("Type r for Rock")
      prompt("Type p for Paper")
      prompt("Type s for Scissors")
      prompt("Type sp for Spock")
      prompt("Type l for Lizard")
      choice = gets.chomp.downcase

      if SHORT_CHOICES.include?(choice)
        choice = SHORT_CHOICES[choice]
        break
      else
        prompt("Invalid Choice. Please try again.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer Chose: #{computer_choice}")
    display_results(choice, computer_choice)
    scores[score_keeper(choice, computer_choice)] += 1
    prompt("Your score: #{scores['player']}; Computer Score: #{scores['computer']}")
    break if scores[score_keeper(choice, computer_choice)] == 5

    prompt("")
    prompt("Would you like to play again?")
    answer = gets.chomp

    break unless answer.downcase.start_with?('y')
  end
  break
end
