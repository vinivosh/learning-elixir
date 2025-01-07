defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug(Ueberauth)

  def callback(conn, params) do
    IO.puts("\nconn.assigns:\n\n#{inspect(conn.assigns, pretty: true)}")
    IO.puts("\nparams:\n\n#{inspect(params, pretty: true)}")

    nil
  end
end
