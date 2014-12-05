class Deck
  attr_reader :deck, :in_play

  def initialize
    generate_deck
  end

  def generate_deck
    suits = ['♠', '♥', '♦', '♣']
    cards = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    card_hash = {}
    @deck = []

    suits.each do |suit|
      cards.each_with_index do |card, index|
        current = card.to_s + suit
        if index <= 9
          card_hash[current] = index + 1
        else
          card_hash[current] = 10
        end
      end
    end

    card_hash.each do |card, value|
      deck << Card.new(card, value)
    end

    @deck.shuffle!
  end
end

class Card
  attr_reader :name, :value

  def initialize(name, value)
    @name = name
    @value = value
  end

  def ace_change_value
    @value += 10
  end

end

class Hand
  attr_reader :hand_array

  def initialize(play_deck, player_name)
    @player_name = player_name
    @hand_array = []
    @play_deck = play_deck
    2.times { draw_card(@player_name) }
  end

  def draw_card(player_name)
    @card = @play_deck.deck.pop
    if player_name == "You"
      puts "#{player_name} were dealt #{@card.name}"
      if @card.name.split("").include?("A")
        puts "Current value of Ace is 1. Set to 11? (Y/N):"
        player_choice = gets.chomp.downcase

        if player_choice == "y"
          @card.ace_change_value
        end
      end
    end
    @hand_array << @card
  end

  def card_total
    total = 0
    @hand_array.each do |card|
      total += card.value
    end
    total
  end
end

def play_game
  player_wins = false
  computer_wins = false
  stand = false

  puts "Welcome to Blackjack!\n\n"
  new_deck = Deck.new

  player_hand = Hand.new(new_deck, "You")
  dealer_hand = Hand.new(new_deck, "Dealer")

  until player_wins == true || computer_wins == true || stand == true
    player_total = player_hand.card_total
    dealer_total = dealer_hand.card_total

    if player_total >= 22
      computer_wins = true
      puts "You busted! Your total is #{player_total}."
    else
      puts "Your card total is #{player_total}."
      puts "Hit or stand? (H/S):"

      player_choice = gets.chomp.downcase

      if player_choice == "h"
        player_hand.draw_card("You")

      elsif player_choice == "s"

        if dealer_total >= 22
          player_wins = true
          puts "Dealer busts!"
        elsif dealer_total <= 17
          dealer_hand.draw_card("Dealer")
        else
          puts "Dealer stays."
          stand = true
        end
      end
    end

  end

  puts "Player total is #{player_total}."
  puts "Dealer total is #{dealer_total}.\n\n"

  if player_wins && !computer_wins
    puts "Player wins!"
  elsif computer_wins && !player_wins
    puts "Computer wins!"
  else
    puts "It's a tie!"
  end
end

play_game
