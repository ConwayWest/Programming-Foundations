require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
MOVES_FIRST = 'choose'.freeze
scores = { 'Player' => 0, 'Computer' => 0 }

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/LineLength, Metrics/MethodLength
def display_board(brd, scores)
  system 'clear'
  puts "FIRST TO 5 WINS!!!".center(25)
  puts "You're a #{PLAYER_MARKER}. Computer is  #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |  "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |  "
  puts "-----+-----+-----"
  puts "     |     |  "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |  "
  puts "-----+-----+-----"
  puts "     |     |  "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |  "
  puts "Player Score: #{scores['Player']}  Computer Score: #{scores['Computer']}"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/LineLength, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
def computer_places_piece!(brd)
  square = nil

  # offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick position 5
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  # random
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(array, delim = ', ', last = 'or')
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join " #{last} "
  else
    array[-1] = "#{last} #{array.last}"
    array.join(delim)
  end
end

def find_at_risk_square(line, board, competitor)
  if board.values_at(*line).count(competitor) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

loop do
  board = initialize_board
  display_board(board, scores)

  first = nil
  loop do
    case MOVES_FIRST
    when 'choose'
      if !first
        prompt "Who goes first? (1 for player, 2 for computer)"
        first = gets.chomp
      end

      if first == '1'
        player_places_piece!(board)
        display_board(board, scores)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece!(board)
        display_board(board, scores)
        break if someone_won?(board) || board_full?(board)
      elsif first == '2'
        computer_places_piece!(board)
        display_board(board, scores)
        break if someone_won?(board) || board_full?(board)

        player_places_piece!(board)
        display_board(board, scores)
        break if someone_won?(board) || board_full?(board)
      end
    when 'player'
      player_places_piece!(board)
      display_board(board, scores)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      display_board(board, scores)
      break if someone_won?(board) || board_full?(board)
    else
      computer_places_piece!(board)
      display_board(board, scores)
      break if someone_won?(board) || board_full?(board)

      player_places_piece!(board)
      display_board(board, scores)
      break if someone_won?(board) || board_full?(board)
    end
  end

  scores[detect_winner(board)] += 1 if someone_won?(board)
  display_board(board, scores)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  # rubocop:disable Metrics/LineLength
  if scores['Player'] >= 5 || scores['Computer'] >= 5
    prompt "Game Over!"
    prompt "Player Score: #{scores['Player']}  Computer Score: #{scores['Computer']}"
    break
  end
  # rubocop:enable Metrics/LineLength

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
