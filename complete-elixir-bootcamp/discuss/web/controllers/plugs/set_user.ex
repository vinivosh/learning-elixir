defmodule Discuss.Plugs.SetUser do
  @moduledoc """
  Documentation for the SetUser Plug.
  """

  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

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
    user_id = get_session(conn, :user_id)

    # credo:disable-for-next-line
    cond do
      # This next one-liner condition does three things in total:
      # - Checks if `user_id` is a truthy value
      # - Checks if a user is returned successfully by Repo.get (which fetches
      # a user from our DB)
      # - It then assigns that user to the `user` var
      user = user_id && Repo.get(User, user_id) ->
        # Assigining to the "user" key all info of the `user` found in the DB.
        # This will be available in `conn["assigns"]["user"]` inside our `conn`
        # for all plugs used after this one!
        assign(conn, :user, user)

      # If any of the two booleans in the condition above fail, we fallback here
      true ->
        assign(conn, :user, nil)
    end
  end
end
