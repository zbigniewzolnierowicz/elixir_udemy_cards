defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(unshuffled_deck) do
    Enum.shuffle(unshuffled_deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, amount) do
    { hand, _rest_of_deck } = Enum.split(deck, amount)
    hand
  end

  def save(hand, filename) do
    binary = :erlang.term_to_binary(hand)
    File.write!(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That binary does not exist."
    end
  end

  def create_hand(amount) do
    Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(amount)
  end
end
