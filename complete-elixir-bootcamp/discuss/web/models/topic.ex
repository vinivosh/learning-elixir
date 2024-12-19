defmodule Discuss.Topic do
  @moduledoc """
  Model doc here
  """

  use Discuss.Web, :model

  schema "topic" do
    field(:title, :string)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
