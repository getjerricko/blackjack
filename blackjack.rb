# blackjack.rb
#
# Build the deck with cards and suits
# Shuffle deck 
# Deal 1 card to player
# Deal 1 card to dealer
# Deal another card to player
# Deal another card to dealer
# Calculate player total cards

def calculate_total(cards)
  # cards input [['2', 'D'], ['6', 'C']]  
  total = 0
  # ['2', '6'] => values 
  cards_value = cards.map {|card| card[0] }

  cards_value.each do |value| 
    # values are originally in string, if you convert letters .to_i
    # their value is 0 i.e. 'J' => 'J'.to_i => 0
    # string 'numbers' convert to whatever their 
    # values are i.e. '1' => '1'.to_i => 1

    if value.to_i == 0        # J, Q, K
      total += 10            
    elsif value == 'A'
      total += 11
    else
      total += value.to_i
    end
  end

  # correct for Aces
  cards_value.select {|value| value == 'A' }.count.times do
    total -= 10 if total > 21
  end
  total 
end

cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10']
#cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'K', 'Q', 'A']
suits = ['C', 'S', 'H', 'D']

puts "*** Welcome to Blackjack *** "
print "Enter your name: "
player_name = gets.chomp

puts ""
puts "Hi, #{player_name}! Let's play! "
puts ""

# build the deck of cards
# [['2', 'C'], ['2', 'S'], ['2', 'H'].. ]
deck = cards.product(suits) 
deck.shuffle!

# deal cards to player and dealer
player_card = []
dealer_card = []
player_card << deck.pop
dealer_card << deck.pop
player_card << deck.pop
dealer_card << deck.pop

player_total = calculate_total(player_card)
dealer_total = calculate_total(dealer_card)

puts "Your cards are #{player_card[0]} #{player_card[1]} and the total is: #{player_total}. "
puts "Dealer's cards are #{dealer_card[0]} #{dealer_card[1]} and the total is: #{dealer_total}. "
puts ""
print "What would you like to do? 1) hit 2) stay "
hit_or_stay = gets.chomp

