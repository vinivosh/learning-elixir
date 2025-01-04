defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(_conn, %{"topic" => topic}) do
    IO.puts("Topic:\n\n#{inspect(topic, pretty: true)}\n\n")

    # TODO: Render something here, of course!
  end
end
