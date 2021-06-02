defmodule Cards do
  def create_deck do
    Enum.zip(["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"], ["Clubs", "Spades", "Diamonds", "Hearts"])
  end
end
