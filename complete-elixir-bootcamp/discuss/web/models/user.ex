defmodule Discuss.User do
  @moduledoc """
  Model doc here
  """

  use Discuss.Web, :model

  schema "user" do
    field(:email, :string)
    field(:provider, :string)
    field(:token, :string)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
