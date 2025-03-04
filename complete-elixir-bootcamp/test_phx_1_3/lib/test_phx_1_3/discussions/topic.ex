defmodule TestPhx13.Discussions.Topic do
  use Ecto.Schema
  import Ecto.Changeset


  schema "topics" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
