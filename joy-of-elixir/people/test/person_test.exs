defmodule People.PersonTest do
  use ExUnit.Case
  alias People.Person
  doctest People.Person

  test "full_name/1" do
    person = %Person{
      first_name: "Ryan",
      last_name: "Bigg"
    }

    assert person |> Person.full_name() === "Ryan Bigg"
  end

  test "full_name/1 with mononyms" do
    teller = %Person{
      first_name: "Teller"
    }

    assert teller |> Person.full_name() === "Teller"

    madonna = %Person{
      first_name: "Madonna"
    }

    assert madonna |> Person.full_name() === "Madonna"
  end

  test "age/1" do
    vini = %Person{
      birthday: ~D[1996-07-11]
    }

    days = Date.diff(Date.utc_today(), vini.birthday)
    years = days / 365.25

    assert vini |> Person.age() === years
  end
end
