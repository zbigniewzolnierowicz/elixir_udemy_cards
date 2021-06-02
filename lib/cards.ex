defmodule Cards do
  @moduledoc """
    Provides methods for deck stuff idk lol
  """

  @doc """
    Returns a list of strings representing a deck of cards
  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles the deck provided by the `unshuffled_deck` argument.
  """
  def shuffle(unshuffled_deck) do
    Enum.shuffle(unshuffled_deck)
  end

  @doc """
    Determines, whether or not a card is inside of a deck or hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Jack of Clubs")
      true

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Jack of Sauce")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Creates a hand of cards with a certain amount of cards, described with the `amount` argument.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 5)
      iex> hand
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades", "Five of Spades"]

  """
  def deal(deck, amount) do
    Enum.split(deck, amount)
  end

  def save(hand, filename) do
    binary = :erlang.term_to_binary(hand)
    File.write!(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That binary does not exist."
    end
  end

  def create_hand(amount) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(amount)
  end
end
