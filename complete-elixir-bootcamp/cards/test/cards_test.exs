defmodule CardsTest do
  @moduledoc """
    Unit tests for the `Cards` module.
  """

  use ExUnit.Case
  doctest Cards

  import Cards

  describe "create_deck/0" do
    test "should return a list with exactly 52 cards" do
      deck_length = length(create_deck())
      assert deck_length == 52
    end
  end

  describe "shuffle/1" do
    test "should randomize a deck" do
      deck = create_deck()
      refute deck == shuffle(deck)
    end
  end
end
