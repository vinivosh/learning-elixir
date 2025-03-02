defmodule Discuss.UserSocket do
  use Phoenix.Socket

  # Channels
  channel("comment:*", Discuss.CommentChannel)

  transport(:websocket, Phoenix.Transports.WebSocket)

  def connect(%{"token" => token}, socket) do
    IO.puts("Token received: #{token}")

    case Phoenix.Token.verify(socket, "key", token) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}

      {:error, _reason} ->
        :error
    end
  end

  def id(_socket), do: nil
end
