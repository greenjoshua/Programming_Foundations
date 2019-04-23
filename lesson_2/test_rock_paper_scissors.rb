VALID_CHOICES = {'rock' => ['lizard', 'scissors'],
                'paper' => ['rock', 'spock'],
                'scissors' => ['paper', 'lizard'],
                'lizard' => ['spock', 'paper'],
                'spock' => ['rock', 'scissors']}

 
def prompt(message)
  Kernel.puts("=> #{message}")
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

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome to #{VALID_CHOICES.keys.join(', ')}!")

player_score = 0
computer_score = 0

loop do
  
  player_score = 0
  computer_score = 0

  loop do
    
    choice = ''
    
    loop do
      prompt("Player score: #{player_score}")
      prompt("Computer score: #{computer_score}")
      prompt("")
      prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}")
      prompt("Shortcuts: Rock - 'r', Paper - 'p', Scissors - 'sc',")
      prompt("Lizard - 'l', Spock - 'sp'")
      choice = Kernel.gets().chomp()
      if choice == 'r' ||
         choice == 'sc' ||
         choice == 'p' ||
         choice == 'sp' ||
         choice == 'l'
        choice = letter_to_word(choice)
      end
  
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end
   
    computer_choice = VALID_CHOICES.keys.sample
  
    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  
    display_results(choice, computer_choice)
    
    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    else
      prompt("No one scored!")
    end
  
    if player_score == 5
      prompt("Player 1 is the Grand Winner!!")
      break
    elsif computer_score == 5
      prompt("Computer is the Grand Winner!!")
      break
    else
     prompt("")
    end
  end
  
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  
end
prompt("Thank you for playing. Good bye!")