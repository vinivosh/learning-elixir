defmodule Discuss.UserSocket do
  use Phoenix.Socket

  # Channels
  channel("comment:*", Discuss.CommentChannel)

  transport(:websocket, Phoenix.Transports.WebSocket)

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
