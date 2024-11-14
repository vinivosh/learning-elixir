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
  Given an Identicon.Image struct, returns a copy of it, but with the `color`
  property set to a tuple with the three color values, ranging from 0 to 255.

  ## Examples
      iex> img = Identicon.hash_str("capivara@proton.com")
      iex> Identicon.pick_color(img)
      %Identicon.Image{
        hex_values: [143, 169, 83, 138, 93, 31, 223, 180,
        121, 7, 105, 167, 149, 159, 118, 147],
        color: {143, 169, 83}
      }
  """
  def pick_color(%Identicon.Image{hex_values: [r, g, b | _tail]} = img) do
    %Identicon.Image{img | color: {r, g, b}}
  end

  @doc """
    Given an Identicon.Image struct, returns a representation of the
    `hex_values` property organized in a 3 by 5 grid --- a matrix, i.e. a
    two-dimensional array.

    Note that leftover elements (those after the 15th one) are discarded from
    the grid!

    ## Examples
        iex> img = Identicon.hash_str("capivara@proton.com")
        iex> Identicon.build_grid(img)
        [
          [143, 169, 83],
          [138, 93, 31],
          [223, 180, 121],
          [7, 105, 167],
          [149, 159, 118]
        ]
  """
  def build_grid(%Identicon.Image{hex_values: hex}) do
    Enum.chunk_every(hex, 3, 3, :discard)
  end

  @doc """
    Given a list with three elements, will return a list of five elements that is the original list mirrored.

    ## Examples
        iex> Identicon.mirror_list([1, 2, 3])
        [1, 2, 3, 2, 1]
  """
  def mirror_list([first, second | _tail] = list) do
    list ++ [second, first]
  end
end
