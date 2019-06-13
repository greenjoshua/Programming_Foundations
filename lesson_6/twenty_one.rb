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

def prompt(message)
  puts "=>#{message}"
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

def hit_or_stay? # asks user to hit or stay and returns answer
  loop do
    prompt "Hit or Stay?"
    choice = gets.chomp.downcase
    break if (choice == "hit") || (choice == "stay")
    prompt "That is not a valid choice!"
  end
  choice
end


loop do
  initialize_deck(deck) 
  initialize_hand(hands, :player, deck) # create player hand
  initialize_hand(hands, :dealer, deck) # create dealer hand
end

