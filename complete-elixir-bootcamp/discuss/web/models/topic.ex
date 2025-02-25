defmodule Discuss.Topic do
  @moduledoc """
  Model doc here
  """

  use Discuss.Web, :model

  schema "topic" do
    field(:title, :string)
    belongs_to(:user, Discuss.User)

    has_many(:comment, Discuss.Comment)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
