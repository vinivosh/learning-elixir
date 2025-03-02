defmodule TestPhx13Web.PageController do
  use TestPhx13Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
