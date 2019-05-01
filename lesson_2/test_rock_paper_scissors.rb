VALID_CHOICES = { 'rock' => ['lizard', 'scissors'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['spock', 'paper'],
                  'spock' => ['rock', 'scissors'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def retrieve_computer_move
  VALID_CHOICES.keys.sample
end

def display_current_score(player, computer)
  prompt("Player score: #{player}")
  prompt("Computer score: #{computer}")
end

def display_move_options()
  prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}")
  prompt("Shortcuts: Rock - 'r', Paper - 'p', Scissors - 'sc',")
  prompt("Lizard - 'l', Spock - 'sp'")
end

def display_invalid_move_input
  prompt("That is not a valid move!")
end

def letter_to_word(letter)
  case letter
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'sp'
    'spock'
  when 'l'
    'lizard'
  end
end

def win?(first, second)
  VALID_CHOICES[first].include?(second)
end

def retrieve_move_input
  choice = ''

    loop do
      choice = Kernel.gets().chomp().downcase

      if choice == 'r' ||
          choice == 'sc' ||
          choice == 'p' ||
          choice == 'sp' ||
          choice == 'l'
          choice = letter_to_word(choice)
      end
      
      break if valid_move_input?(choice)
      
      display_invalid_move_input
    end

  choice
end

def valid_move_input?(choice)
  VALID_CHOICES.include?(choice)
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

def increment_score(decision, computer_decision, keep_score)
  if win?(decision, computer_decision)
    keep_score[:player_score] += 1
  elsif win?(computer_decision, decision)
    keep_score[:computer_score] += 1
  else
    prompt("No one scored!")
  end
end

def display_match_won(points)
  if points[:player_score] == 5
    prompt("Player 1 is the Grand Winner!!")
  elsif points[:computer_score] == 5
    prompt("Computer is the Grand Winner!!")
  else
    prompt("")
  end
end

prompt("Welcome to #{VALID_CHOICES.keys.join(', ')}!")

score = { player_score: 0, computer_score: 0 }

loop do
  score = { player_score: 0, computer_score: 0 }
 
  loop do
    display_current_score(score[:player_score], score[:computer_score])

    prompt("")

    display_move_options()

    choice = retrieve_move_input

    computer_choice = retrieve_computer_move

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    increment_score(choice, computer_choice, score)

    display_match_won(score)

    if score[:player_score] == 5 || score[:computer_score] == 5
      display_current_score(score[:player_score], score[:computer_score])
      break
    end
  end

  prompt("Do you want to play again?")

  answer = Kernel.gets().chomp()

  if answer.downcase() == 'no'
    break
  else
    prompt("Good luck!")
  end
end

prompt("Thank you for playing. Good bye!")