defmodule Cards do
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(unshuffled_deck) do
    Enum.shuffle(unshuffled_deck)
  end
end
