defmodule Discuss.CommentChannel do
  @moduledoc """
  CommentChannel module.
  """

  use Discuss.Web, :channel

  def join(name, _params, socket) do
    IO.puts("############################################################")
    IO.puts("Websockets are working! Channel was joined with success.")
    IO.puts("Name:\n#{inspect(name, limit: :infinity)}")
    IO.puts("############################################################")
    {:ok, %{}, socket}
  end

  def handle_in(name, msg, socket) do
    IO.puts("########################################")
    IO.puts("Websockets are working! Message was received with success.")
    IO.puts("Name:\n#{inspect(name, limit: :infinity)}")
    IO.puts("Message:\n#{inspect(msg, limit: :infinity)}")
    IO.puts("########################################")
    {:reply, :ok, socket}
  end
end
