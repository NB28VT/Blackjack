#!/usr/bin/env ruby
require 'pry'

class Deck
  def initialize
    @deck = []
    @in_play
    card_hash = {}
    generate_deck
    shuffle_deck
    in_play
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

    card_hash.each do |card, value|
      @deck << Card.new(card, value)
    end
  end

  def shuffle_deck
    @deck.shuffle!
  end

  def self.in_play(card, value)
    card_hash[:card] = value
  end
end

class Card
  def initialize
    generate_card
  end

  def generate_card
    @card = @deck.sample
    deck.in_play(@card.key, @card.val)
  end

end

class Hand
  def initialize(player)
    @player = player
    @card1 = Card.new(deck)
    @card2 = Card.new(deck)
    @hand = [@card1, @card2]
  end

  def hand
    @hand
  end

  def draw
    @hand << Card.new(deck)
  end
end

deck = Deck.new

Hand.new("Daniel")
