defmodule CardsTest do
  @moduledoc """
    Unit tests for the `Cards` module.
  """

  use ExUnit.Case
  doctest Cards

  describe "create_deck/0" do
    test "should return a list with exactly 52 cards" do
      deck_length = length(Cards.create_deck())
      assert deck_length == 52
    end
  end
end
