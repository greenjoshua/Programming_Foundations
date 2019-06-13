WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
VALID_FIRST_MOVE_OPTIONS = ['player', 'computer', 'choose']
FIRST_MOVE = 'choose'
WINNING_SCORE = 5

def prompt(msg)
  puts "=>#{msg}"
end

def clear
  system('cls') || system('clear')
end

def first_move?
  FIRST_MOVE != 'choose'
end

def valid_answer?(ans)
  ans == 'y' || ans == 'n'
end

def choose_first_move
  choice = ''
  loop do
    prompt "Do you want to go first? ('y' or 'n')"
    choice = gets.chomp.downcase
    break if valid_answer?(choice)
    prompt("That is not a valid choice.")
  end

  choice == 'y' ? 'player' : 'computer'
end

def set_first_move
  if FIRST_MOVE == 'choose'
    choose_first_move
  elsif VALID_FIRST_MOVE_OPTIONS.include?(FIRST_MOVE)
    FIRST_MOVE
  end
end

def valid_number?(num)
  num == num.to_i.to_s
end

def alternate_player(player)
  player == 'player' ? 'computer' : 'player'
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  clear
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

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  elsif player == 'computer'
    computer_place_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp
    break if empty_squares(brd).include?(square.to_i) && valid_number?(square)
    prompt("Sorry, that's not a valid choice.")
  end

  brd[square.to_i] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def offensive_select_at_risk_square(sqre, brd)
  WINNING_LINES.each do |line|
    sqre = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if sqre
  end

  sqre
end

def defensive_select_at_risk_square(sqre, brd)
  if !sqre
    WINNING_LINES.each do |line|
      sqre = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if sqre
    end
  end

  sqre
end

def select_square_five(sqre, brd)
  if !sqre
    sqre = 5 if empty_squares(brd).include?(5)
  end

  sqre
end

def computer_place_piece!(brd)
  square = nil

  square = offensive_select_at_risk_square(square, brd) unless !square.nil?
  square = defensive_select_at_risk_square(square, brd) unless !square.nil?
  square = select_square_five(square, brd) unless !square.nil?

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

def match_ended?(score, alt_score)
  (score == WINNING_SCORE) || (alt_score == WINNING_SCORE)
end

def display_match_winner(score)
  if score == WINNING_SCORE
    prompt("Player is the Grand Winner!")
  else
    prompt("Computer is the Grand Winner!")
  end
end

def play_again?(ans)
  valid_answer?(ans) && (ans == 'y')
end

loop do
  board = initialize_board
  score = { player_score: 0, computer_score: 0 }

  prompt "Welcome to Tic-Tac-Toe!"
  prompt "Each round is worth 1 point."
  prompt "If there is a tie, then no points are awarded."
  prompt "The first one to score 5 points wins!"
  sleep 4

  clear
  loop do
    board = initialize_board

    current_player = set_first_move

    loop do
      display_board(board)

      display_score(score[:player_score], score[:computer_score])

      place_piece!(board, current_player)

      break if someone_won?(board) || board_full?(board)

      current_player = alternate_player(current_player)
    end

    display_board(board)

    if someone_won?(board)
      prompt("#{detect_winner(board)} won!")
    else
      prompt("It's a tie!")
    end

    keep_score(score, board)

    break if match_ended?(score[:player_score], score[:computer_score])
  end

  display_match_winner(score[:player_score])

  prompt("Play again? (Y/N")

  answer = gets.chomp.downcase

  break if !play_again?(answer)

  clear
end

prompt("Thanks for playing Tic-Tac-Toe. Goodbye!")
