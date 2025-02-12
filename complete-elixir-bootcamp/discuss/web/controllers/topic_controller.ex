defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  plug(
    Discuss.Plugs.RequireAuth
    when action in [:new, :create, :edit, :update, :delete]
  )

  plug(:check_topic_ownership when action in [:edit, :update, :delete])

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    changeset =
      conn.assigns.user
      |> build_assoc(:topic)
      |> Topic.changeset(topic)

    case Repo.insert(changeset) do
      {:ok, _new_topic} ->
        conn
        |> put_flash(:info, "Topic created")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Invalid topic! Nothing was created")
        |> render("new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => topic_id}) do
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)

    render(conn, "edit.html", changeset: changeset, topic: topic)
  end

  def update(conn, %{"id" => topic_id, "topic" => topic}) do
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic updated!")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, topic: old_topic)
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    # credo:disable-for-next-line
    Repo.get!(Topic, topic_id) |> Repo.delete!()

    conn
    |> put_flash(:info, "Topic deleted")
    |> redirect(to: topic_path(conn, :index))
  end

  @doc """
  A function plug for checking if the current user actually owns the topic being
  edited/deleted.

  Function plugs are very useful when the plug will never be used across
  multiple modules!
  """
  def check_topic_ownership(conn, _params) do
    user_id = conn.assigns.user.id
    %{params: %{"id" => topic_id}} = conn
    topic = Repo.get(Topic, topic_id)

    case topic do
      %Topic{user_id: ^user_id} ->
        conn

      %Topic{user_id: _} ->
        conn
        |> put_flash(:error, "You cannot edit or delete topics that are not owned by you.")
        |> redirect(to: topic_path(conn, :index))
        |> halt()

      nil ->
        conn
        |> put_flash(:error, "Topic with ID #{topic_id} does not exist.")
        |> redirect(to: topic_path(conn, :index))
        |> halt()
    end
  end
end
