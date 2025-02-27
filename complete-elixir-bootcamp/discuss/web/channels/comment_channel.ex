defmodule Discuss.CommentChannel do
  @moduledoc """
  CommentChannel module.
  """

  use Discuss.Web, :channel

  alias Discuss.Topic

  def join("comment:" <> topic_id = name, _params, socket) do
    IO.puts("############################################################")
    IO.puts("Websockets are working! Channel was joined with success.")
    IO.puts("Name:\n#{inspect(name, limit: :infinity)}")
    IO.puts("############################################################")

    topic_id = String.to_integer(topic_id)
    _topic = Repo.get(Topic, topic_id)

    {:ok, %{}, socket}
  end

  def handle_in(name, %{"content" => _content} = msg, socket) do
    IO.puts("########################################")
    IO.puts("Websockets are working! Message was received with success.")
    IO.puts("Name: #{inspect(name, limit: :infinity)}")
    IO.puts("Message: #{inspect(msg, limit: :infinity)}")
    IO.puts("########################################")

    {:reply, :ok, socket}
  end
end
