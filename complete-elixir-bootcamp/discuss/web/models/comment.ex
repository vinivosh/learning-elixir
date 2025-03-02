defmodule Discuss.Comment do
  @moduledoc """
  Comment schema.
  """
  use Discuss.Web, :model

  # Tells what to include when converting a Comment into JSON
  @derive {Poison.Encoder, only: [:content, :user]}

  schema "comment" do
    field(:content, :string)
    belongs_to(:user, Discuss.User)
    belongs_to(:topic, Discuss.Topic)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
