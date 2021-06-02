defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Cards.create_deck creates 52 cards" do
    deck_size = length(Cards.create_deck)
    assert deck_size == 52
  end

  test "Cards.shuffle randomizes the deck" do
    deck = Cards.create_deck
    shuffled_deck = Cards.shuffle(deck)
    refute deck == shuffled_deck
  end
end
