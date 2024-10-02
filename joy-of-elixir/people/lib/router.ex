defmodule People.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get("hello/:name", to: People.Hello)
  get("goodbye/:name", to: People.Goodbye)
  get("get_age/:date", to: People.GetAge)

  match _ do
    send_resp(conn, 404, "There's nothing here")
  end
end
