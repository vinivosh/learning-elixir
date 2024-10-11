import Config

config :cards,
  key1: %{
    subkey1: 1,
    subkey2: 2,
    subkey3: 3,
    subkey4: 4
  },
  key2: "value2",
  key3: "value3"

# import_config "#{config_env()}.exs"

# user = %{name: "Alice", id: "i86a9sdla212", hashed_password: "$2y$10$DyM42fphQJmYa5tCb3wQ2u0lRuwehAU4LbLr7p2DJX8Jk9SWguVbG"}
# list = 1..500 |> Enum.to_list
# list = [7, 78, 91, 92, 93, 94, 95, 96, 97, 120]
# var_inspected = inspect(list)
# IO.puts("'var_inspected' with default inspect:\n#{var_inspected}\n")

old_inspect_fun = Inspect.Opts.default_inspect_fun()

Inspect.Opts.default_inspect_fun(fn
  value, opts ->
    old_inspect_fun.(value, %{
      opts
      | limit: :infinity,
        printable_limit: :infinity,
        charlists: :as_lists
    })
end)

# var_inspected = inspect(list)
# IO.puts("'var_inspected' with new inspect definition:\n#{var_inspected}\n")
