@card_hash = {'A♠' => 1}
@player_total = 10
@dealer_total = 8

def ace(card)
  if (@player_total <= 10 || @dealer_total <= 10) && ['A♠', 'A♥', 'A♦', 'A♣'].include?(card.keys[0])
    @card_hash = {
      card.keys[0] => 11
    }
  elsif ['A♠', 'A♥', 'A♦', 'A♣'].include?(card.keys[0])
    @card_hash = {
      card.keys[0] => 1
    }
  end
end

p ace(@card_hash)
p @player_total
p @card_hash
