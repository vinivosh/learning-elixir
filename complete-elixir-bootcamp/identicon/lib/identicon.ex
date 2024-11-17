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
    image =
      hash_str(input)
      |> pick_color()
      |> build_grid()
      |> filter_odd_from_grid()
      |> build_pixel_map()
      |> draw_img()

    File.write("identicon.png", image)
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
    Given an Identicon.Image struct, returns an updated struct where the `grid`
    key contains a representation of the value in the `hex_values` key organized
    in a grid --- a matrix, i.e. a two-dimensional array. This grid is made out
    of the first 15 elements from the list, so a 3x5 grid initially, that then
    gets vertically mirrored to become a 5x5 grid instead.

    Note that leftover elements (those after the 15th one) are discarded from
    the grid!

    ## Examples
        iex> img = Identicon.hash_str("capivara@proton.com")
        iex> %{grid: grid} = Identicon.build_grid(img)
        iex> grid
        [{143, 0}, {169, 1}, {83, 2}, {169, 3}, {143, 4}, {138, 5}, {93, 6}, {31, 7}, {93, 8}, {138, 9}, {223, 10}, {180, 11}, {121, 12}, {180, 13}, {223, 14}, {7, 15}, {105, 16}, {167, 17}, {105, 18}, {7, 19}, {149, 20}, {159, 21}, {118, 22}, {159, 23}, {149, 24}]
  """
  def build_grid(%Identicon.Image{hex_values: hex} = img) do
    grid =
      Enum.chunk_every(hex, 3, 3, :discard)
      |> Enum.map(&mirror_list/1)
      |> List.flatten()
      |> Enum.with_index()

    %Identicon.Image{img | grid: grid}
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

  @doc """
    Given an Identicon.Image struct, returns an updated struct where the `grid`
    key is updated to contain only the elements `{v, i}` where `v` is even.

    ## Examples
        iex> img = Identicon.hash_str("capivara@proton.com") |> Identicon.build_grid
        iex> %{grid: grid} = Identicon.filter_odd_from_grid(img)
        iex> grid
        [{138, 5}, {138, 9}, {180, 11}, {180, 13}, {118, 22}]
  """
  def filter_odd_from_grid(%Identicon.Image{grid: grid} = img) do
    grid_filtered =
      Enum.filter(grid, fn {num, _index} ->
        rem(num, 2) == 0
      end)

    %Identicon.Image{img | grid: grid_filtered}
  end

  @doc """
    TODO: write docs here

    ## Examples
        iex> img = Identicon.hash_str("capivara@proton.com") |> Identicon.build_grid
        iex> %{grid: grid} = Identicon.filter_odd_from_grid(img)
        iex> grid
        [{138, 5}, {138, 9}, {180, 11}, {180, 13}, {118, 22}]
  """
  def build_pixel_map(%Identicon.Image{grid: grid} = img) do
    pixel_map =
      Enum.map(grid, fn {_hex_code, idx} ->
        side_len = 50

        # Calculating the X, Y coordinates for the top-left corner of the
        # rectangle
        x_coord = rem(idx, 5) * side_len
        y_coord = div(idx, 5) * side_len

        # X, Y coordinates for the bottom-right corner of the rectangle are
        # the same for the top-left + side_len
        {{x_coord, y_coord}, {x_coord + side_len, y_coord + side_len}}
      end)

    %Identicon.Image{img | pixel_map: pixel_map}
  end

  @doc """
    TODO: write docs here

    ## Examples
        iex> img = Identicon.hash_str("capivara@proton.com") |> Identicon.build_grid
        iex> %{grid: grid} = Identicon.filter_odd_from_grid(img)
        iex> grid
        [{138, 5}, {138, 9}, {180, 11}, {180, 13}, {118, 22}]
  """
  def draw_img(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    side_len = 50
    image = :egd.create(side_len * 5, side_len * 5)
    fill_color = :egd.color(color)

    Enum.each(pixel_map, fn {top_left, bottom_right} ->
      :egd.filledRectangle(image, top_left, bottom_right, fill_color)
    end)

    :egd.render(image)
  end
end
