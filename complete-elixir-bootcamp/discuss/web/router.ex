defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(Discuss.Plugs.SetUser)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Discuss do
    # Use the default browser stack
    pipe_through(:browser)

    # get("/", TopicController, :index)
    # get("/topics/new", TopicController, :new)
    # post("/topics", TopicController, :create)
    # get("/topics/:id/edit", TopicController, :edit)
    # put("/topics/:id", TopicController, :update)
    # delete("/topics/:id", TopicController, :delete)

    resources("/", TopicController)
  end

  scope "/auth", Discuss do
    pipe_through(:browser)

    get("/sign_out", AuthController, :sign_out)
    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :callback)
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
