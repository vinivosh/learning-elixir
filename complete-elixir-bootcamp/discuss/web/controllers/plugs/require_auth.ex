defmodule Discuss.Plugs.RequireAuth do
  @moduledoc """
  Documentation for the RequireAuth Plug.
  """

  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Router.Helpers

  def init(_params) do
    nil
  end

  def call(conn, _params) do
    # If the user is *not* logged in
    if is_nil(conn.assigns[:user]) do
      conn
      |> put_flash(:error, "You must be logged in to perform this action.")
      |> redirect(to: Helpers.topic_path(conn, :index))
      # halt/1 tells Phoenix to stop sending this conn through to the next plugs
      |> halt()

      # If the user is logged in
    else
      conn
    end
  end
end
