defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Given an `input` string, generates an unique **Identicon** image and saves it
  to a file

  ## Examples

      iex> Identicon.generate("capivara@gmail.com")
      "./capivara-at-gmail-dot-com.png"

  """
  def generate(input) do
    hash_str(input)
    # |> other_func_1
    # |> other_func_2
    # |> other_func_3
  end

  @doc """
  Computes the MD5 hash of the `input` string, returning it as a list of numbers

  ## Examples
      iex> Identicon.hash_str("capivara@gmail.com")
      []
  """
  def hash_str(input) do
    input
  end
end
