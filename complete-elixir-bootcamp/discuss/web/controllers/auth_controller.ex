defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug(Ueberauth)

  alias Discuss.User

  def callback(
        %{assigns: %{ueberauth_auth: auth}} = conn,
        %{"code" => code, "provider" => provider} = params
      ) do
    IO.puts("\n`auth` struct:\n\n#{inspect(auth, pretty: true)}")
    IO.puts("\n`params` struct:\n\n#{inspect(params, pretty: true)}")

    user_params = %{
      token: auth.credentials.token,
      email: auth.info.email,
      provider: provider
    }

    changeset = User.changeset(%User{}, user_params)
  end

  # Returns the user with the e-mail specified in the changeset, if found, or
  # creates and returns a new user if not
  defp upsert_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        # TODO: Actually create the new user here
        nil

      user ->
        {:ok, user}
    end
  end
end
