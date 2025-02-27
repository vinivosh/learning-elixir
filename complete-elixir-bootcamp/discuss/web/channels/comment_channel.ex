defmodule Discuss.CommentChannel do
  @moduledoc """
  CommentChannel module.
  """

  use Discuss.Web, :channel

  def join(name, _params, socket) do
    {:ok, %{}, socket}
  end

  def handle_in(name, msg, socket) do
    IO.puts("########################################")
    IO.puts("Name:")
    IO.puts(name)
    IO.puts("Message:\n#{inspect(msg, limit: :infinity)}")
    IO.puts("########################################")

    {:reply, :ok, socket}
  end
end
