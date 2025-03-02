# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :test_phx_1_3,
  ecto_repos: [TestPhx13.Repo]

# Configures the endpoint
config :test_phx_1_3, TestPhx13Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BemLzrZGLGnGkNg4sr6323BkEYTCSMjFNxrTuLEqId7GGis5GnvpyKKFU9nFrP+k",
  render_errors: [view: TestPhx13Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TestPhx13.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
