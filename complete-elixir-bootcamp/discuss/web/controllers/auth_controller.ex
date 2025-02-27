defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug(Ueberauth)

  alias Discuss.User

  def callback(
        %{assigns: %{ueberauth_auth: auth}} = conn,
        %{"code" => _code, "provider" => provider} = _params
      ) do
    user_params = %{
      token: auth.credentials.token,
      email: auth.info.email,
      provider: provider
    }

    changeset = User.changeset(%User{}, user_params)
    sign_in(conn, changeset)
  end

  defp sign_in(conn, changeset) do
    case upsert_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: topic_path(conn, :index))

      {:error, reason} ->
        IO.puts("Something went wrong when attempting sign in! Reason: #{inspect(reason)}")

        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: topic_path(conn, :index))
    end
  end

  def sign_out(conn, _params) do
    # `configure_session(drop: true)` deletes EVERYTHING stored in the session!
    # This is safer than just setting `conn.assigns.user` to `nil`, because it
    # makes sure that any other data on the user we start saving to the session
    # in the future will also get deleted when a user signs out. Future proof!
    conn
    |> configure_session(drop: true)
    |> redirect(to: topic_path(conn, :index))
  end

  # Returns the user with the e-mail specified in the changeset, if found, or
  # creates and returns a new user if not
  defp upsert_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)

      user ->
        {:ok, user}
    end
  end
end
