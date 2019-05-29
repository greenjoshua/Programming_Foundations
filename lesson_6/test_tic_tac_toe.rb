require 'pry'


WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=>#{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "Player is a #{PLAYER_MARKER}"
  puts "Computer is a #{COMPUTER_MARKER}"
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
  brd.keys.select { |num| brd[num] == ' ' }
end

def joinor(arr, delimiter=', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_place_piece!(brd)
  square = nil
  
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end
  
  if !square
    square = 5 if empty_squares(brd).include?(5)
  end
  
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

def display_score(player, computer)
  prompt("Player score: #{player}")
  prompt("Computer score: #{computer}")
end

def keep_score(scre_hsh, brd)
  if detect_winner(brd) == 'Player'
    scre_hsh[:player_score] += 1
  elsif detect_winner(brd) == 'Computer'
    scre_hsh[:computer_score] += 1
  end
end

loop do
  board = initialize_board
  score = {player_score: 0, computer_score: 0}
  loop do
    board = initialize_board
    
    loop do
      display_board(board)
      display_score(score[:player_score], score[:computer_score])
  
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
  
      computer_place_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  
    display_board(board)
  
    if someone_won?(board)
      prompt("#{detect_winner(board)} won!")
    else
      prompt("It's a tie!")
    end
    
    keep_score(score, board)
    
    break if (score[:player_score] == 5) || (score[:computer_score] == 5)
  end
  
  if score[:player_score] == 5
    prompt("Player is the Grand Winner!")
  else
    prompt("Computer is the Grand Winner!")
  end
  
  prompt("Play again? (Y/N")
  answer = gets.chomp
  break if answer.downcase == 'n'
end

prompt("Thanks for playing Tic-Tac-Toe. Goodbye!")
