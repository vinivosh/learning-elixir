import Config

config :cards,
  key1: %{
    subkey1: 1,
    subkey2: 2,
    subkey3: 3,
  },
  key2: "value2",
  key3: "value3"

# import_config "#{config_env()}.exs"

# user = %{name: "Alice", id: "i86a9sdla212", hashed_password: "$2y$10$DyM42fphQJmYa5tCb3wQ2u0lRuwehAU4LbLr7p2DJX8Jk9SWguVbG"}
# list = 1..500 |> Enum.to_list
list = [7, 97, 7, 97]
var_inspected = inspect(list)
IO.puts("`var_inspected` with default inspect:\n#{var_inspected}\n")

old_inspect_fun = Inspect.Opts.default_inspect_fun()

Inspect.Opts.default_inspect_fun(fn
  value, _ ->
    old_inspect_fun.(value, Inspect.Opts.new(limit: 3, charlists: :lists))
end)

var_inspected = inspect(list)
IO.puts("`var_inspected` with new inspect definition:\n#{var_inspected}\n")
