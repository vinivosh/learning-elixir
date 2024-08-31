defmodule People.GetAge do
  alias People.Person
  import Plug.Conn

  def init(options), do: options

  def call(%Plug.Conn{params: %{"date" => birthday}} = conn, _opts) do
    age =
      %Person{birthday: Date.from_iso8601!(birthday)}
      |> Person.age

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Your age is #{age} years.")
  end
end
