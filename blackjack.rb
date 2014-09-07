# blackjack.rb
#
# Build the deck with cards and suits
# Shuffle deck 
# Deal 1 card to player
# Deal 1 card to dealer
# Deal another card to player
# Deal another card to dealer
# Calculate player total cards


cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'K', 'Q', 'A']
suits = ['C', 'S', 'H', 'D']

puts "*** Welcome to Blackjack *** "
print "Enter your name: "
player_name = gets.chomp

puts ""
puts "Hi, #{player_name}! Let's play! "
puts ""

# build the deck of cards
deck = cards.product(suits) 
deck.shuffle!

# deal cards to player and dealer
player_card = []
dealer_card = []
player_card << deck.pop
dealer_card << deck.pop
player_card << deck.pop
dealer_card << deck.pop

puts "Your cards are #{player_card[0]} #{player_card[1]} and the total is: "
puts "Dealer's cards are #{dealer_card[0]} #{dealer_card[1]} and the total is: "
