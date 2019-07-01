WINNING_SCORE = 21
DEALER_MAX_HIT_VALUE = 17
GRAND_WINNER = 5

def prompt(message)
  puts "=>#{message}"
end

def clear
  system('cls') || system('clear')
end

deck = {}
hands = { player: [], dealer: [] }

def initialize_deck(dck)
  dck["H"] = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  dck["D"] = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  dck["S"] = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  dck["C"] = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
end

def initialize_hand(hnd, player, dck)
  loop do
    break if hnd[player].size >= 2
    card = deal_card(dck)
    add_to_hand(hnd, player, card)
  end
end

def deal_card(dck)
  suit = dck.keys.sample
  card = dck[suit].sample
  dck[suit].delete(card)
  card
end

def add_to_hand(hnd, player, crd)
  hnd[player] << crd
end

def valid_answer?(ans, continue, stay, quit)
  (ans == continue) || (ans == stay) || (ans == quit)
end

def play_again?
  answer = ''
  puts "------------"

  loop do
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    break if valid_answer?(answer, "y", "n")
    prompt "That is not a valid response."
  end

  answer
end

def hit_or_stay? # asks user to hit or stay and returns answer
  choice = ''
  loop do
    prompt "Hit or Stay?"
    choice = gets.chomp.downcase
    break if valid_answer?(choice, "hit", "stay", "q")
    prompt "That is not a valid choice!"
  end

  choice
end

def hit(dck, hnds, plyr)
  card = deal_card(dck)
  add_to_hand(hnds, plyr, card)
end

def calculate_total(values)
  sum = 0

  values.each do |val|
    if ['J', 'Q', 'K'].include?(val)
      sum += 10
    elsif val == 'A'
      ace = calc_ace(sum)
      sum += ace
    elsif [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(val.to_i)
      sum += val.to_i
    end
  end

  sum
end

def calc_ace(total)
  if total + 11 > WINNING_SCORE
    1
  else
    11
  end
end

def bust(scre)
  scre > WINNING_SCORE
end

def calculate_final_score(player, dealer)
  player > dealer ? "Player" : "Dealer"
end

def determine_winner(p_score, d_score)
  if bust(p_score)
    "Dealer"
  elsif bust(d_score)
    "Player"
  elsif d_score < p_score
    "Player"
  elsif d_score > p_score
    "Dealer"
  else
    "Tie"
  end
end

def join_cards(arr)
  if arr.size == 2
    arr.join(" and ")
  else
    last = arr[-1]
    arr[0..-2].join(", ") + " and " + last.to_s
  end
end

def display_cards(hnds, scre, plyer, dealr)
  prompt "Dealer has: #{join_cards(hnds[dealr])} for a total of #{scre[dealr]}."
  prompt "You have: #{join_cards(hnds[plyer])} for a total of #{scre[plyer]}."
end

def busted?(player, dealer)
  prompt "Player busted!" if bust(player)
  prompt "Dealer busted!" if bust(dealer)
end

def tie(winnr)
  prompt "It's a tie!" if winnr == "Tie"
end

def keep_max_score(scre_hsh, winnr)
  if winnr == 'Player'
    scre_hsh[:player] += 1
  elsif winnr == 'Dealer'
    scre_hsh[:dealer] += 1
  end
end

def match_ended?(score, alt_score)
  (score == GRAND_WINNER) || (alt_score == GRAND_WINNER)
end

def display_match_winner(score)
  if score == GRAND_WINNER
    prompt("Player is the Grand Winner!")
  else
    prompt("Dealer is the Grand Winner!")
  end
end

loop do
  max_score = { player: 0, dealer: 0 }
  prompt "Welcome to 21!"
  prompt "This is a multi-round game where the first to win #{GRAND_WINNER}" \
         " rounds is declared the Grand Winner!"
  prompt "Good Luck!"
  sleep 5

  loop do
    clear
    score = { player: 0, dealer: 0 }
    choice = ''
    winner = nil
    deck = {}
    hands = { player: [], dealer: [] }

    loop do
      clear
      initialize_deck(deck)
      initialize_hand(hands, :player, deck) # create player hand
      initialize_hand(hands, :dealer, deck) # create dealer hand
      prompt "Player Rounds Won: #{max_score[:player]}"
      prompt "Dealer Rounds Won: #{max_score[:dealer]}"
      puts "------------------------"
      puts "------------------------"

      loop do
        score[:dealer] = calculate_total(hands[:dealer])
        score[:player] = calculate_total(hands[:player])
        prompt "Dealer has: #{hands[:dealer][0]} and unknown card."
        prompt "You have: #{join_cards(hands[:player])}" \
               " for a total of #{score[:player]}."
        break if bust(score[:player])
        puts "------------------------"
        puts "------------------------"
        choice = hit_or_stay?
        break if (choice == "stay") || (choice == "q")
        hit(deck, hands, :player)
        prompt "You hit!"
        puts "------------------------"
        puts "------------------------"
      end

      puts "------------------------"
      puts "------------------------"
      prompt "Dealer Turn..." if !bust(score[:player])
      sleep 2

      until (score[:dealer] >= DEALER_MAX_HIT_VALUE) || bust(score[:player])
        score[:dealer] = calculate_total(hands[:dealer])
        display_cards(hands, score, :player, :dealer)
        break if bust(score[:player]) || bust(score[:dealer]) || (choice == "q")
        hit(deck, hands, :dealer)
        prompt "Dealer hit!"
        puts "------------------------"
        puts "------------------------"
        score[:dealer] = calculate_total(hands[:dealer])
        sleep 3
      end

      display_cards(hands, score, :player, :dealer) if bust(score[:dealer])
      busted?(score[:player], score[:dealer])
      sleep 2

      puts "------------------------"
      puts "------------------------"
      display_cards(hands, score, :player, :dealer) if !bust(score[:player])
      winner = determine_winner(score[:player], score[:dealer])
      prompt "The winner is #{winner}!" unless winner == "Tie"
      tie(winner)
      sleep 2
      break if winner || (choice == "q")
    end

    keep_max_score(max_score, winner)
    break if match_ended?(max_score[:player], max_score[:dealer])
    sleep 2
  end

  display_match_winner(max_score[:player])
  answer = play_again?
  break if answer == "n"
end

puts "------------------------"
prompt "Thank you for playing 21! Goodbye!"
