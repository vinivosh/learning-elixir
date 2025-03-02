defmodule Discuss.User do
  @moduledoc """
  Model doc here
  """

  use Discuss.Web, :model

  # Tells what to include when converting a User into JSON
  @derive {Poison.Encoder, only: [:email]}

  schema "user" do
    field(:email, :string)
    field(:provider, :string)
    field(:token, :string)
    has_many(:topic, Discuss.Topic)
    has_many(:comment, Discuss.Comment)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
