defmodule Discuss.Plugs.SetUser do
  @moduledoc """
  Documentation for the SetUser Plug.
  """

  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User
  alias Discuss.Router.Helpers

  @doc """
  Function used in plugs to run some expensive process once, when initializing
  the application, and pass the results to all calls to the call/1 function.
  """
  def init(_params) do
    nil
  end

  @doc """
  This `_params` argument would be the value returned by the init/1 function
  in this plug!
  """
  def call(conn, _params) do
    nil
  end
end
