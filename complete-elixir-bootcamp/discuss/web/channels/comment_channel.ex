defmodule Discuss.CommentChannel do
  @moduledoc """
  CommentChannel module.
  """

  use Discuss.Web, :channel

  def join(name, _params, socket) do
    IO.puts("########################################")
    IO.puts("Name:")
    IO.puts(name)
    IO.puts("########################################")

    {:ok, %{}, socket}
  end

  def handle_in() do
  end
end
