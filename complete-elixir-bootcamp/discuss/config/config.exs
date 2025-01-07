# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

env_vars = System.get_env()

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WqJ8TBzIADMFTnEoKs9AO15Kt1iT1PGEbeyCrqgFyYKNEHOzhL48j+5uCHlmi40s",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure your database
config :discuss, Discuss.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: Map.get(env_vars, "POSTGRES_SERVER", "localhost"),
  port: Map.get(env_vars, "POSTGRES_PORT", "5432"),
  database: Map.get(env_vars, "POSTGRES_DB", "stephen-grider-discuss"),
  username: Map.get(env_vars, "POSTGRES_USER", "postgres"),
  password: Map.get(env_vars, "POSTGRES_PASSWORD"),
  pool_size: 10

# Überauth config
config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: Map.get(env_vars, "GH_OAUTH_CLIENT_ID"),
  client_secret: Map.get(env_vars, "GH_OAUTH_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
