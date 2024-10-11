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

# Redefining the inspect/2 function to use new global defaults:
# limit: :infinity
# printable_limit: :infinity
old_inspect_fun = Inspect.Opts.default_inspect_fun()

Inspect.Opts.default_inspect_fun(fn
  # "50" and "4096" are the default values for the Inspect.Opts struct, for the
  # "limit:" key (used for enumerables) and the "printable_limit:" key (used
  # for strings), respectively.
  #
  # Refer to the documentation for more info:
  # https://hexdocs.pm/elixir/1.17.2/Inspect.Opts.html

  value, %Inspect.Opts{limit: limit, printable_limit: printable_limit} = opts
  when limit == 50 and
         printable_limit == 4096 ->
    old_inspect_fun.(value, %{
      opts
      | limit: :infinity,
        printable_limit: :infinity,
        charlists: :as_lists
    })

  value, %Inspect.Opts{limit: limit} = opts when limit == 50 ->
    old_inspect_fun.(value, %{opts | limit: :infinity, charlists: :as_lists})

  value, %Inspect.Opts{printable_limit: printable_limit} = opts when printable_limit == 4096 ->
    old_inspect_fun.(value, %{opts | printable_limit: :infinity, charlists: :as_lists})

  value, %Inspect.Opts{} = opts ->
    old_inspect_fun.(value, opts)
end)
