defmodule Lasagna do
  @moduledoc """
  Lasagna exercise at Exercism
  Available at: https://exercism.org/tracks/elixir/exercises/lasagna
  """

  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(min_elapsed) do
    expected_minutes_in_oven() - min_elapsed
  end

  def preparation_time_in_minutes(num_layers) do
    num_layers * 2
  end

  def total_time_in_minutes(num_layers, min_elapsed) do
    preparation_time_in_minutes(num_layers) + min_elapsed
  end

  def alarm() do
    "Ding!"
  end
end
