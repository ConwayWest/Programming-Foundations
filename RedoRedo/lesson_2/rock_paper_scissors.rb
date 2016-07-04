VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def win?(first, second)
  first == 'rock' && second == 'scissors' ||
    first == 'scissors' && second == 'paper' ||
    first == 'paper' && second == 'rock'
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
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Invalid Choice. Please try again.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer Chose: #{computer_choice}")
  display_results(choice, computer_choice)

  prompt("Would you like to play again?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end
