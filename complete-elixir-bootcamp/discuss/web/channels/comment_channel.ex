defmodule Discuss.CommentChannel do
  @moduledoc """
  CommentChannel module.
  """

  use Discuss.Web, :channel

  alias Discuss.{Topic, Comment}

  def join("comment:" <> topic_id = name, _params, socket) do
    IO.puts("\n########################################")
    IO.puts("Websockets are working! Channel was joined with success.")
    IO.puts("Name:\n#{inspect(name, limit: :infinity)}")
    IO.puts("########################################")

    topic_id = String.to_integer(topic_id)

    topic =
      Topic
      |> Repo.get(topic_id)
      |> Repo.preload(:comment)

    {:ok, %{comments: topic.comment}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content} = msg, socket) do
    IO.puts("\n########################################")
    IO.puts("Websockets are working! Message was received with success.")
    IO.puts("Name: #{inspect(name, limit: :infinity)}")
    IO.puts("Message: #{inspect(msg, limit: :infinity)}")
    IO.puts("########################################")

    topic = socket.assigns.topic
    user_id = socket.assigns.user_id

    changeset =
      topic
      |> build_assoc(:comment, user_id: user_id)
      |> Comment.changeset(%{content: content})

    case Repo.insert(changeset) do
      {:ok, comment} ->
        IO.puts("Comment inserted into the DB:\n#{inspect(comment, limit: :infinity)}")

        broadcast!(
          socket,
          "comment:#{socket.assigns.topic.id}:new",
          %{comment: comment}
        )

        {:reply, :ok, socket}

      {:error, _reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end

    {:reply, :ok, socket}
  end
end
