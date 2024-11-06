defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Given an `input` string, generates an unique **Identicon** image and saves it
  to a file.

  ## Examples

      iex> Identicon.generate("capivara@proton.com")
      "./capivara-at-proton-dot-com.png"

  """
  def generate(input) do
    hash_str(input)
    # |> other_func_1
    # |> other_func_2
    # |> other_func_3

    # ! Placeholder!
    "./capivara-at-proton-dot-com.png"
  end

  @doc """
  Computes the MD5 hash of the `input` string, returning it as a list of numbers.

  ## Examples
      iex> Identicon.hash_str("capivara@proton.com")
      %Identicon.Image{
        hex_values: [143, 169, 83, 138, 93, 31, 223, 180, 121, 7, 105, 167, 149,
        159, 118, 147]
      }
  """
  def hash_str(input) do
    hex_values =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex_values: hex_values}
  end

  @doc """
  Given an Identicon.Image struct, picks an RGB color and returns it, as a list
  with the three color values, ranging from 0 to 255.

  ## Examples
      iex> img = Identicon.hash_str("capivara@proton.com")
      iex> Identicon.pick_color(img)
      [143, 169, 83]
  """
  def pick_color(img) do
    %Identicon.Image{hex_values: [r, g, b | _tail]} = img
    [r, g, b]
  end
end
