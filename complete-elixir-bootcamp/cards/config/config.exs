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

# list = 1..500 |> Enum.to_list
user = %{name: "Alice", id: "i86a9sdla212", hashed_password: "$2y$10$DyM42fphQJmYa5tCb3wQ2u0lRuwehAU4LbLr7p2DJX8Jk9SWguVbG"}
user_inspected = inspect(user)
IO.puts("`user` with default inspect:\n#{user_inspected}\n")

old_inspect_fun = Inspect.Opts.default_inspect_fun()

Inspect.Opts.default_inspect_fun(fn
  %{hashed_password: _} = map, opts ->
    old_inspect_fun.(%{map | hashed_password: "[SECRET]"}, opts)

  value, opts ->
    old_inspect_fun.(value, opts)
end)

user_inspected = inspect(user)
IO.puts("`user` with new inspect definition:\n#{user_inspected}\n")
