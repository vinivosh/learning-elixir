defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(_conn, %{"topic" => topic}) do
    IO.puts("Topic:\n\n#{inspect(topic, pretty: true)}\n")

    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, new_topic} ->
        IO.puts("New topic created:\n\n#{inspect(new_topic, pretty: true)}\n")

      {:error, changeset} ->
        IO.puts("New topic is invalid! Changeset:\n\n#{inspect(changeset, pretty: true)}\n")
    end
  end
end
