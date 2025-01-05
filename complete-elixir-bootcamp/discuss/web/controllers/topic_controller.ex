defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    IO.puts("All topics:\n\n#{inspect(topics, pretty: true)}\n")

    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    IO.puts("Topic:\n\n#{inspect(topic, pretty: true)}\n")

    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, new_topic} ->
        IO.puts("New topic created:\n\n#{inspect(new_topic, pretty: true)}\n")

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
