defmodule Cards do
  @moduledoc """
  Provides functions for creating and handling a standard deck of playing cards.
  """

  @doc """
    Creates a standard deck with 52 cards.

    The cards always come in the same order (`["Ace of Spades", "Ace of Clubs",
    "Ace of Hearts", "Ace of Diamonds", "Two of Spades", ... , "Queen of
    Diamonds", "King of Spades", "King of Clubs", "King of Hearts",
    "King of Diamonds"]`).
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

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a `deck` into a hand of `hand_size` many cards and the remainder of
    the deck, returned as a tuple.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, deck} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Ace of Clubs"]

  """
  def deal(deck, hand_size) do
    {hand, deck_remainder} = Enum.split(deck, hand_size)
  end

  def save_to_file(filename, deck) do
    bin = :erlang.term_to_binary(deck)
    File.write(filename, bin)
  end

  def read_from_file(filename) do
    case File.read(filename) do
      {:ok, bin} -> :erlang.binary_to_term(bin)
      {:error, _reason} -> "File does not exist"
    end
  end

  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
