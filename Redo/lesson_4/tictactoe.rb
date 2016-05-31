require 'pry'

FIRST_SETTING = 'CHOOSE'.freeze
PLAYERS = ['YOU', 'COMPUTER']
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze       # diagnols

def prompt(msg)
  puts "=> #{msg}"
end

def clear
  system "cls"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  prompt "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

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
    prompt "Choose a position to place a piece: (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  #offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  #defense
  if !square 
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  #pick square 5
  if empty_squares(brd).include?(5)
    square = 5
  end

  #random
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

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

def joinor(arr, delimiter = ', ', word = 'and')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def keep_score(brd)
  winner = detect_winner(brd)
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def place_piece!(brd, current_player)
  #if current_player == 'YOU'
  #  player_places_piece!(brd)
  #elsif current_player == 'COMPUTER'
  #  computer_places_piece!(brd)
  #end

  player_places_piece!(brd) if current_player == 'YOU'
  computer_places_piece!(brd) if current_player == 'COMPUTER'
end

def alternate_player(current_player)
  current_player == 'YOU' ? 'COMPUTER' : 'YOU'
end

loop do
  scores = {"Player" => 0, "Computer" => 0}
  prompt "Welcome to Tic Tac Toe"
  prompt "First to 5 wins!"
  prompt "Player Score: #{scores["Player"]}. Computer Score: #{scores["Computer"]}."
  prompt ""
  loop do
    board = initialize_board
    clear
    current_player = PLAYERS.sample.to_s
    prompt "#{current_player} goes first!"
    prompt ""
    loop do
        display_board(board)
        place_piece!(board, current_player)
        break if someone_won?(board) || board_full?(board)
        current_player = alternate_player(current_player)
        clear
    end

    clear
    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      scores[keep_score(board)] += 1
      prompt "Player Score: #{scores["Player"]}. Computer Score: #{scores["Computer"]}."
    else
      prompt "It's a tie!"
    end

    break if scores[keep_score(board)] == 5

    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
  break
end

prompt ""
prompt "Thanks for playing Tic Tac Toe! Goodbye!"
