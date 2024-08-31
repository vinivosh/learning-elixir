defmodule RouterTest do
  use ExUnit.Case
  use Plug.Test

  @opts People.Router.init([])

  test "non-existing link" do
    conn = conn(:get, "/asdadasdd")

    conn = People.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "There's nothing here"
  end

  test "People.Hello plug" do
    conn = conn(:get, "/hello/Vini")

    conn = People.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello, Vini!"
  end

  test "People.Goodbye plug" do
    conn = conn(:get, "/goodbye/Vini")

    conn = People.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Goodbye, Vini"
  end
end
