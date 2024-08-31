defmodule People.GetAge do
  alias People.Person
  import Plug.Conn

  def init(options), do: options

  def call(%Plug.Conn{params: %{"date" => birthday_str}} = conn, _opts) do
    {:ok, birthday} = Date.from_iso8601(birthday_str)
    person = %Person{birthday: birthday}

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Your age is #{People.Person.age(person)} years.")
  end
end
