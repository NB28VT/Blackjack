#!/usr/bin/env ruby
#
# Write a program where the user can play a game of **Blackjack**. Define and use the following classes to organize your code=>
#
# * `Card` to represent an individual playing card. This class should contain the suit and the value and provide methods for determining what type of card it is (e.g. face card or ace).
# * `Deck` to represent a collection of 52 cards. When dealing a hand this class can be used to supply the `Card` objects.
# * `Hand` to represent the player's and dealer's hand. This class will need to determine the best score based on the cards that have been dealt.


require 'pry'

class Deck
  attr_reader :deck, :in_play

  def initialize
    generate_deck
  end

  def generate_deck
    card_hash = {
      'A♠' => 1,
      'A♥' => 1,
      'A♦' => 1,
      'A♣' => 1,
      '2♠'=> 2,
      '2♥'=> 2,
      '2♦'=> 2,
      '2♣'=> 2,
      '3♠'=> 3,
      '3♥'=> 3,
      '3♦'=> 3,
      '3♣'=> 3,
      '4♠'=> 4,
      '4♥'=> 4,
      '4♦'=> 4,
      '4♣'=> 4,
      '5♠'=> 5,
      '5♥'=> 5,
      '5♦'=> 5,
      '5♣'=> 5,
      '6♠'=> 6,
      '6♥'=> 6,
      '6♦'=> 6,
      '6♣'=> 6,
      '7♠'=> 7,
      '7♥'=> 7,
      '7♦'=> 7,
      '7♣'=> 7,
      '8♠'=> 8,
      '8♥'=> 8,
      '8♦'=> 8,
      '8♣'=> 8,
      '9♠'=> 9,
      '9♥'=> 9,
      '9♦'=> 9,
      '9♣'=> 9,
      '10♠'=> 10,
      '10♥'=> 10,
      '10♦'=> 10,
      '10♣'=> 10,
      'J♠'=> 10,
      'J♥'=> 10,
      'J♦'=> 10,
      'J♣'=> 10,
      'Q♠'=> 10,
      'Q♥'=> 10,
      'Q♦'=> 10,
      'Q♣'=> 10,
      'K♠'=> 10,
      'K♥'=> 10,
      'K♦'=> 10,
      'K♣'=> 10
    }

    @deck = []

    card_hash.each do |card, value|
      deck << Card.new(card,value)
    end

    @deck.shuffle!

    end

    @in_play = []
end


class Card
  attr_reader :name, :value

  def initialize(name, value)
    @name = name
    @value = value
  end
end

class Hand
  attr_reader :hand_array

  def initialize(play_deck, player_name)
    @player_name = player_name
    @hand_array = []
    @play_deck = play_deck
    2.times { draw_card(@player_name)}
  end

  def draw_card(player_name)
    @card = @play_deck.deck.pop
    puts "#{player_name} were dealt #{@card.name}"
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



################################################ GAME METHODS #################



#
# def player_deal(new_deck)
#   player_hand = Hand.new(new_deck, "Me")
#   player_total = player_hand.card_total
#
#
#
#
# end
#
#
# def dealer_t
#   dealer_total = dealer_hand.card_total
#
# end
#
#
# def turn
#   player_hit_or_stand
#   # dealer_hit_or_stand
# end
#
# def player_hit_or_stand
#
#   total = @player_hand.card_total
#
#
#
#
#
#
#   # logic that decides if player hits or stands
# end
#
# def dealer_hit_or_stand
#   # logic decides if dealer hits or stands
#   # if hand count > 17?
#   #   stand
#   # else
#   #   dealer_turn
#   # end
# end










# !!!!!!!!!!!!!!!!!!!! ACES ARE 1 OR 11

def play_game
  player_wins = false
  computer_wins = false

  puts "Welcome to Blackjack!\n\n"
  new_deck = Deck.new

  player_hand = Hand.new(new_deck, "You")
  dealer_hand = Hand.new(new_deck, "Dealer")



















  until player_wins == true || computer_wins == true
    player_total = player_hand.card_total




    if player_total >= 22
      computer_wins = true
      puts "Bust: total is #{player_total}, house wins"
    elsif player_total == 21
      puts "You win"
      player_wins = true
    else
      puts "Your card total is: #{player_total}"
      puts "Hit or stand (H/S):"

      player_choice = gets.chomp.downcase

      if player_choice == "h"
        player_hand.draw_card("You")
      end
    end









  end
end




play_game



# until player_wins == true || computer_wins == true
#   player_hand = Hand.new(new_deck)
#
#   #binding.pry
#
#   puts "Hit or stand (H/S):"
#
#
# end
#
#
# if player_wins == true
#   puts "Player wins!"
# elsif computer_wins == true
#   puts "Dealer wins!"
# end
