defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def generate_identicon(input) do
    hash_str(input)
    # |> other_func_1
    # |> other_func_2
    # |> other_func_3
  end

  def hash_str(input) do
    input
  end
end
