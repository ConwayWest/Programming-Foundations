VALID_CHOICES = %w(r p s l sp).freeze
WINNING_PAIRS = {
  'r' => %w(s l),
  'p' => %w(r sp),
  's' => %w(p l),
  'l' => %w(p sp),
  'sp' => %w(r s)
}.freeze
player_score = 0
computer_score = 0

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WINNING_PAIRS[first].include?(second)
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

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if player_score == 5
    prompt("You won the match! You: #{player_score} Computer: #{computer_score}")
    break
  elsif computer_score == 5
    prompt("The computer won the match! You: #{player_score} Computer: #{computer_score}")
    break
  else
    prompt("You: #{player_score} Computer: #{computer_score}")
  end

  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  clear_screen
end

prompt("Thank you for playing. Goodbye!")
