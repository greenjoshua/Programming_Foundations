require 'pry'
require 'pry-byebug'
=begin
1. Initialize deck
  deck = { "H" => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
           "D" => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
           "S" => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
           "C" => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  }
  
  Initialize Hands: Player and Dealer


2. Deal cards to player and dealer
  Given a deck,
    select two cards from deck and set them equal to a variable, delete the cards from the deck
    Set Player hands = the two cards that were deleted from the deck
    select two more cards from the deck and set them equal to a variable, delete the cards from the deck
    

3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

PLAYER_WINNING_SCORE = 21
DEALER_WINNING_SCORE = 17

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

def valid_answer?(ans, continue_response, quit_response)
  (ans == continue_response) || (ans == quit_response)
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
    break if valid_answer?(choice, "hit", "stay")
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
  if total + 11 > PLAYER_WINNING_SCORE
    return 1
  else
    return 11
  end
end

def bust(player_score)
  player_score > PLAYER_WINNING_SCORE 
end

def dealer_bust(dealer_score)
  dealer_score >= DEALER_WINNING_SCORE
end

def calculate_final_score(player, dealer)
  player > dealer ? "Player" : "Dealer"
end

def determine_winner(p_score, d_score, p_choice, d_choice)
  if bust(p_score)
    return "Dealer"
  elsif dealer_bust(d_score)
    return "Player"
  elsif p_choice == 'stay' && d_choice == 'stay'
    return calculate_final_score(p_score, d_score)
  else
    "Tie"
  end
end

def join_cards(arr)
  temp_arr = arr
  if arr.size == 2 
    arr.join(" and ")
  else
    temp_arr[-1] = "and #{arr.last}"
    arr.join(", ")
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

loop do
  clear
  
  score = { player: 0, dealer: 0 }
  choice = ''
  dealer_choice = ''
  winner = nil
  deck = {}
  hands = { player: [], dealer: [] }

  loop do
    initialize_deck(deck) 
    initialize_hand(hands, :player, deck) # create player hand
    initialize_hand(hands, :dealer, deck) # create dealer hand
    prompt "Welcome to 21!"
    binding.pry
    loop do
      score[:dealer] = calculate_total(hands[:dealer])
      score[:player] = calculate_total(hands[:player])
      prompt "Dealer has: #{hnds[dealr][0]} and unknown card."
      prompt "You have: #{join_cards(hnds[plyer])} for a total of #{scre[plyer]}."
      busted?(score[:player], score[:dealer])
      break if bust(score[:player])
      #binding.pry
      choice = hit_or_stay?
      #binding.pry
      break if choice == "stay"
      hit(deck, hands, :player)
      prompt "You hit!"
      #binding.pry
    end
    
    winner = determine_winner(score[:player], score[:dealer], choice, dealer_choice)
    prompt "Dealer Turn..." unless bust(score[:player])
    sleep 2
    dealer_choice = "stay"
    
    loop do
      score[:dealer] = calculate_total(hands[:dealer])
      display_cards(hands, score, :player, :dealer)
      break if dealer_bust(score[:dealer]) || bust(score[:player]) || winner
      hit(deck, hands, :dealer)
      prompt "Dealer hit!"
      #binding.pry
      sleep 7
    end
    #binding.pry
    display_cards(hands, score, :player, :dealer)
    winner = determine_winner(score[:player], score[:dealer], choice, dealer_choice) if !winner
    binding.pry
    busted?(score[:player], score[:dealer])
    winner = "Dealer" if bust(score[:player]) 
    prompt "The winner is #{winner}!" unless winner == "Tie"
    tie(winner)
    break if winner
  end
  answer = play_again?
  break if answer == "n"
end

prompt "Thank you for playing 21! Goodbye!"
