#!/usr/bin/env ruby
#
# Write a program where the user can play a game of **Blackjack**. Define and use the following classes to organize your code=>
#
# * `Card` to represent an individual playing card. This class should contain the suit and the value and provide methods for determining what type of card it is (e.g. face card or ace).
# * `Deck` to represent a collection of 52 cards. When dealing a hand this class can be used to supply the `Card` objects.
# * `Hand` to represent the player's and dealer's hand. This class will need to determine the best score based on the cards that have been dealt.


require 'pry'

class Deck

  def initialize
    generte_deck
  end

  def generate_deck

    # suits = [ '♠','♥', '♦', '♣' ]
    # values = ['A', '2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K']
    #

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

    deck = []

    card_hash.each do |card, value|
      deck << Card.new(card,value)
    end

    binding.pry




  #
  #
  #   cards = values.product(suits)
  #
  #   cards.each do |card|
  #     card_array << card.join()
  #   end
  #
  #
  #
  #
  # end





end


class Card
  def initialize(name, value)
    @name = name
    @value = value
  end
end




class Hand
  def initialize(player ,card1, card2)
    @player = player
    @card1 = card1
    @card2 = card2
  end
end




new_deck = Deck.new

binding.pry
